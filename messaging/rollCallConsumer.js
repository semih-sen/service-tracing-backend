const pool = require("../helpers/database/database");
const amqp = require("amqplib");
const moment = require("moment");
moment.locale("tr");

addRollCallFromQueue();
async function addRollCallFromQueue() {
  console.log("Waiting message");
 
  try {
    const connection = await amqp.connect("amqp://localhost:5672");
    const channel = await connection.createChannel();
    const assertion = await channel.assertQueue("rollCallsQueue");
    const notificationChannel = await connection.createChannel();
    const notificationAssertion = await notificationChannel.assertQueue("notificationQueue");
    
    channel.consume("rollCallsQueue", (message) => {
     const data = JSON.parse(message.content.toString());
       pool.query(
        `INSERT INTO public."rollcalls"("studentid","serviceid","employeeid","status","datetime","type") 
          VALUES($1,$2,$3,$4,$5,$6)`,
        [
          data.studentId,
          data.serviceId,
          data.employeeId,
          data.status,
          data.datetime,
          data.type,
        ]
      );
      
       pool.query(
        'SELECT * FROM public."Students" WHERE "id"=$1',
        [data.studentId]
      ).then((studentsResult)=>{
         
        const notification =  {
            parentId: studentsResult.rows[0].parentId,
            studentId: data.studentId,
            title:
              data.status === "true"
                ? "Öğrenciniz servise bindi"
                : "Öğrenciniz servise binmedi",
            content:
              data.status === "true"
                ? `Öğrenciniz ${
                    studentsResult.rows[0].name
                  } servise binmiştir.\nİşlem tarihi: ${moment().format("LLLL")}`
                : `Öğrenciniz ${
                    studentsResult.rows[0].name
                  } servise binmemiştir.\nİşlem tarihi: ${moment().format("LLLL")}`,
          };
        notificationChannel.sendToQueue(
            "notificationQueue",
            Buffer.from(JSON.stringify(notification))
          );
      });
      
      
     

      
      channel.ack(message);
      
      
      //console.log("Notification", notification, "---", "data", data);
    });

    /*
      data.res.status(200).json({
        message: "Succesfully added",
      });*/
  } catch (err) {
    /*data.res.status(400).json({ success: false, message: error.message });*/
    console.error(err);
    
  }
}
