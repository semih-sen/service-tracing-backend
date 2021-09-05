const pool = require("../helpers/database/database");
const amqp = require("amqplib");

addNotificationFromQueue();

async function addNotificationFromQueue() {
  console.log("Message waiting");
  try {
    const connection = await amqp.connect("amqp://localhost:5672");
    const channel = await connection.createChannel();
    const assertion = await channel.assertQueue("notificationQueue");

    channel.consume("notificationQueue", (message) => {
      const data = JSON.parse(message.content.toString());
      pool.query(
        `Insert Into public."notifications"("parentId","studentId","title","content") VALUES ($1,$2,$3,$4)`,
        [data.parentId, data.studentId, data.title, data.content]
      );
      channel.ack(message);
      
    });
  } catch (error) {
    console.error(error)
  }
}
