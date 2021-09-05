const amqp = require("amqplib");
const pool = require("../helpers/database/database");
const moment = require("moment");
moment.locale("tr");

addTransportationFromQueue();

async function addTransportationFromQueue() {
  console.log("Waiting Message");
  try {
    const connection = await amqp.connect("amqp://localhost:5672");
    const channel = await connection.createChannel();
    const assertion = await channel.assertQueue("transportationQueue");
    const notificationChannel = await connection.createChannel();
    const notificationAssertion = await notificationChannel.assertQueue(
      "notificationQueue"
    );

    channel.consume("transportationQueue", (message) => {
      const data = JSON.parse(message.content.toString());
      pool.query(
        `INSERT INTO public."Transportations"("studentId","serviceId","employeeId","type","datetime","isOutOfAddress")
         VALUES($1,$2,$3,$4,$5,$6)`,
        [
          data.studentId,
          data.serviceId,
          data.employeeId,
          data.type,
          data.datetime,
          data.isOutOfAddress,
        ]
      );

      pool.query(`Select * from public."Students" WHERE "id"=$1`, [
        data.studentId,
      ]).then(studentsResult => {
          const notification = {
              parentId: studentsResult.rows[0].parentId,
              studentId: data.studentId,
              title: "Öğrenciniz servisten indi",
              content: data.isOutOfAddress===true?`Öğrenciniz ${studentsResult.rows[0].name} adres dışı iniş yapmıştır.\nİşlem tarihi: ${moment().format("LLLL")}`:data.type==="Evden Okula"?`Öğrenciniz ${studentsResult.rows[0].name} okulda iniş yapmıştır\nİşlem tarihi: ${moment().format("LLLL")}`:`Öğrenciniz ${studentsResult.rows[0].name} evinde iniş yapmıştır\nİşlem tarihi: ${moment().format("LLLL")}`
          }
          notificationChannel.sendToQueue("notificationQueue",Buffer.from(JSON.stringify(notification)))
      });

      channel.ack(message);
    });
  } catch (error) {
    console.error(error);
  }
}
