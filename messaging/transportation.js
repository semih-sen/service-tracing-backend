const amqp = require("amqplib");
const pool = require("../helpers/database/database");

Date.prototype.addHours = function(h) {
    this.setTime(this.getTime() + (h*60*60*1000));
    return this;
  }

const addTransportationToQueue = async (req,res,next)=>{
    let body=req.body;
    const data ={
        studentId: body.studentId,
        serviceId: body.serviceId,
        employeeId: body.employeeId,
        type: body.type,
        datetime: new Date().addHours(6),
        isOutOfAddress: body.isOutOfAddress,
    }
    try {
        const connection = await amqp.connect("amqp://localhost:5672");
        const channel = await connection.createChannel();
        const assertion = await channel.assertQueue("transportationQueue");
        channel.sendToQueue("transportationQueue",Buffer.from(JSON.stringify(data)));
        res.status(200).json({success: true, message:"Succesfully saved"})
    } catch (error) {
        res.status(404).json({success: false,message: error.message})
    }
}

module.exports ={addTransportationToQueue};