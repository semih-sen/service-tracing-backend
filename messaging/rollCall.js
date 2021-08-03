const amqp = require('amqplib');
const {addRollCallFromQueue} = require('../controllers/v1/rollCallController')

const addRollCallToQueue = async (req, res, next) => {
    let body = req.body;
    const data = {
      studentId: body.studentId,
      serviceId: body.serviceId,
      employeeId: body.employeeId,
      status: body.status,
      datetime: new Date(),
      type: body.type,
    };
  
    try {
      const connection = await amqp.connect("amqp://localhost:5672");
      const channel = await connection.createChannel();
      const assertion = await channel.assertQueue("rollCallsQueue");
  
      channel.sendToQueue("rollCallsQueue", Buffer.from(JSON.stringify(data)));
      res.status(200).json({success: true, message:"Succesfully saved"})
      
    } catch (error) {
      res.status(400).json({success: false, message: error.message});
    }
  };

  module.exports={addRollCallToQueue}