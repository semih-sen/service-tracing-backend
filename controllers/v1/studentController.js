const pool = require("../../helpers/database/database");

const getAllStudents = async (req, res, next) => {
  // console.log(`${process.env.DB_USERNAME}`);
  if(req.query.id){
    await pool
    .query('SELECT * FROM public."Students" WHERE "schoolId"=$1 and "id"=$2',[res.locals.schoolId,req.query.id])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of students",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting students. It is detail of the error: " +
          err.message,
      })
    );
  }
  
  else{
  await pool
    .query('SELECT * FROM public."Students" WHERE "schoolId"=$1',[res.locals.schoolId])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of students",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting students. It is detail of the error: " +
          err.message,
      })
    );}
};

const getStudentDetail = async (req, res, next) => {
  // console.log(`${process.env.DB_USERNAME}`);
  if(req.query.parentId){await pool
    .query('SELECT * FROM "studentsView" WHERE "schoolId"=$1 and "parentId"=$2',[res.locals.schoolId,req.query.parentId])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of students details",
      })
    )
    .catch((err) =>{
    next(err)
      res.status(400).json({
        message:
          "An error occurred while getting students. It is detail of the error: " +
          err.message,
      })}
    );}else{
  await pool
    .query('SELECT * FROM "studentsView" WHERE "schoolId"=$1',[res.locals.schoolId])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of students details",
      })
    )
    .catch((err) =>{
    next(err)
      res.status(400).json({
        message:
          "An error occurred while getting students. It is detail of the error: " +
          err.message,
      })}
    );}
};

const getStudentsWithServiceId = async (req, res, next) => {
  await pool
    .query('SELECT * FROM public."Students" WHERE "serviceId"=$1',[res.locals.serviceId])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of students",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting students. It is detail of the error: " +
          err.message,
      })
    );
  
}

const getStudentsWithParentId=async(req, res,next) =>{
 
    await pool
    .query('SELECT * FROM public."Students" WHERE "parentId"=$1',[res.locals.parentId])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of students",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting students. It is detail of the error: " +
          err.message,
      })
    );
  
}

const addStudent = async (req, res, next) => {
  let body = req.body;
  await pool.query(
    'INSERT INTO public."Students"("name","parentId","schoolId","serviceId","number","className","address","phoneNumber","note","orderNumber","orderNumber2") VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11)',
    [
      body.name,
      body.parentId,
      res.locals.schoolId,
      body.serviceId,
      body.number,
      body.className,
      body.address,
      body.phoneNumber, 
      body.note,0,0
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
};

const updateStudent = async (req, res, next) => {
  let body = req.body;
  await pool.query(
    'UPDATE public."Students" SET "name"=$1,"parentId"=$2,"schoolId"=$3,"serviceId"=$4, "number"=$5, "className"=$6, "address"=$7, "phoneNumber"=$8,"note"=$9 WHERE "id"=$10',
    [
      body.name,
      body.parentId,
      body.schoolId,
      body.serviceId,
      body.number,
      body.className,
      body.address,
      body.phoneNumber, body.note,
      body.id,
    ],
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(400).json({
          message:
            "An error occurred while updating. It is detail of the error: " +
            err.message,
        });
      } else {
        res.status(200).json({
          message: "Succesfully updated",
        });
      }
    }
  );
};

const updateStudentOrderNumber = (req, res, next)=>{
  let orderNumber=req.body.orderNumber;
  let id=req.body.id;

  pool.query('UPDATE public."Students" SET "orderNumber"=$1 WHERE "id"=$2',[orderNumber,id],(err,result)=>{
    if (err) {
      console.error(err);
      res.status(400).json({
        message:
          "An error occurred while updating. It is detail of the error: " +
          err.message,
      });
    } else {
      res.status(200).json({
        message: "Succesfully updated",
      });
    }
  });
}

const updateStudentOrderNumber2 = (req, res, next)=>{
  let orderNumber=req.body.orderNumber2;
  let id=req.body.id;

  pool.query('UPDATE public."Students" SET "orderNumber2"=$1 WHERE "id"=$2',[orderNumber,id],(err,result)=>{
    if (err) {
      console.error(err);
      res.status(400).json({
        message:
          "An error occurred while updating. It is detail of the error: " +
          err.message,
      });
    } else {
      res.status(200).json({
        message: "Succesfully updated",
      });
    }
  });
}

const deleteStudent = async (req, res, next) => {
  let body = req.body;
  await pool.query(
    'DELETE FROM public."Students" WHERE "id"=$1',
    [body.id],
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(400).json({
          message:
            "An error occurred while deleting. It is detail of the error: " +
            err.message,
        });
      } else {
        if (result.rowCount > 0) {
          res.status(200).json({
            message: "Succesfully deleted",
          });
        } else {
          res.status(400).json({
            message: "Not found",
          });
        }
      }
    }
  );
};

module.exports = {
  getAllStudents,
  addStudent,
  updateStudent,getStudentsWithServiceId,
  deleteStudent,updateStudentOrderNumber,updateStudentOrderNumber2,getStudentDetail,getStudentsWithParentId
};
