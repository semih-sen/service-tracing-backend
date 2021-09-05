const pool = require("../../helpers/database/database");
const amqp = require("amqplib");
const moment = require("moment");
moment.locale("tr");

const getRollCallDetails= async (req, res, next) => {
  await pool.query(`select * from "rollcallsview" where "parentId"=$1 order by "datetime" desc`,[res.locals.parentId]).then(result=>{
    res.status(200).json({
      data:result.rows
    })
  }).catch(err=>{
    res.status(500).json({success: false, message: error.message})
  })
}


const getRollCallForManager = async (req, res, next) => {
  await pool
  .query('SELECT * FROM public."rollcallsview" where "schoolId"=$1 order by "datetime" desc',[res.locals.schoolId])
  .then((jsonData) =>
    res.status(200).json({
      data: jsonData.rows,
      message: "List of roll calls",
    })
  )
  .catch((err) =>
    res.status(400).json({
      message:
        "An error occurred while getting roll cals. It is detail of the error: " +
        err.message,
    })
  );
}

const getRollCalls = async (req, res, next) => {
  if (req.query.parentId) {
    await pool
      .query(
        'Select * from "rollcalls" as r inner join "Students" as s on r.studentid=s.id Where s."parentId"=$1',
        [req.query.parentId]
      )
      .then((jsonData) =>
        res.status(200).json({
          data: jsonData.rows,
          message: "List of roll calls",
        })
      )
      .catch((err) =>
        res.status(400).json({
          message:
            "An error occurred while getting roll cals. It is detail of the error: " +
            err.message,
        })
      );
  } else {
    await pool
      .query('SELECT * FROM public."rollcalls"')
      .then((jsonData) =>
        res.status(200).json({
          data: jsonData.rows,
          message: "List of roll calls",
        })
      )
      .catch((err) =>
        res.status(400).json({
          message:
            "An error occurred while getting roll cals. It is detail of the error: " +
            err.message,
        })
      );
  }
};



const addRollCall = async (req, res, next) => {
  try {
    const connection = await amqp.connect("amqp://localhost:5672");
    const channel = await connection.createChannel();
    const assertion = await channel.assertQueue("rollCallsQueue");

    channel.consume("rollCallsQueue", (message) => {
      let data = JSON.parse(message.content.toString());
      console.log(data);
    });
    res.status(200).json({
      message: "Succesfully added",
    });
  } catch (error) {
    res.status(400).json({success: false, message: error.message})
  }
};

const addRollCall2 = async (req, res, next) => {
  let body = req.body;
  await pool.query(
    'INSERT INTO public."rollcalls"("studentid","serviceid","employeeid","status","datetime","type") VALUES($1,$2,$3,$4,$5,$6)',
    [
      body.studentId,
      body.serviceId,
      body.employeeId,
      body.status,
      new Date(),
      body.type,
    ],
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(400).json({
          message:
            "An error occurred while adding. It is detail of the error: " +
            err.message,
        });
      } else {
        res.status(200).json({
          message: "Succesfully added",
        });
      }
    }
  );
  await pool
    .query('SELECT * FROM public."Students" WHERE "id"=$1', [body.studentId])
    .then((result) => {
      pool.query(
        'Insert Into public."notifications"("parentId","studentId","title","content") VALUES ($1,$2,$3,$4)',
        [
          result.rows[0].parentId,
          body.studentId,
          body.status === "true"
            ? "Öğrenciniz servise bindi"
            : "Öğrenciniz servise binmedi",
          body.status === "true"
            ? `Öğrenciniz ${
                result.rows[0].name
              } servise binmiştir.\nİşlem tarihi: ${moment().format("LLLL")}`
            : `Öğrenciniz ${
                result.rows[0].name
              } servise binmemiştir.\nİşlem tarihi: ${moment().format("LLLL")}`,
        ],
        (err, result) => {
          if (err) {
            console.error(err);
          }
        }
      );
    });
};

const updateRollCall = (req, res, next) => {};

const deleteRollCall = (req, res, next) => {};

module.exports = {
  getRollCalls,
  addRollCall,
  updateRollCall,
  getRollCallDetails,
  deleteRollCall,
  getRollCallForManager
};
