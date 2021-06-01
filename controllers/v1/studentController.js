const pool = require("../../helpers/database/database");

const getAllStudents = async (req, res, next) => {
   // console.log(`${process.env.DB_USERNAME}`);
  await pool
    .query('SELECT * FROM public."Students"')
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
};

const addStudent = async (req, res, next) => {
  let body = req.body;
  await pool.query(
    'INSERT INTO public."Students"("name","parentId","schoolId","number","class","address") VALUES($1,$2,$3,$4,$5,$6)',
    [body.name,body.parentId,body.schoolId, body.number, body.class, body.address],
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
    'UPDATE public."Students" SET "name"=$1,"parentId"=$2,"schoolId"=$3, "number"=$4, "class"=$5, "address"=$6 WHERE "id"=$7',
    [
      body.name,
      body.number,
      body.class,
      body.address,
      body.phoneNumber,
      body.mail,
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
        }else{
            res.status(400).json({
                message: "Not found",
            })
        }
      }
    }
  );
};

module.exports = {
  getAllStudents,
  addStudent,
  updateStudent,
  deleteStudent,
};
