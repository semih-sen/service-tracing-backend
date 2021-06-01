const pool = require("../../helpers/database/database");

const getAllSchools = async (req, res, next) => {

  await pool
    .query('SELECT * FROM public."Schools" WHERE "id"=$1',[res.locals.schoolId])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of schools",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting schools. It is detail of the error: " +
          err.message,
      })
    );
};
const addSchool = (req, res, next) => {
  let body = req.body;
  pool.query(
    'INSERT INTO public."Schools"("name","address","phoneNumber","mail") VALUES($1,$2,$3,$4)',
    [body.name, body.address, body.phoneNumber, body.mail],
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
const updateSchool = (req, res, next) => {
    let body = req.body;
    pool.query('UPDATE public."Schools" SET "name"=$1, "address"=$2, "phoneNumber"=$3,"mail"=$4 WHERE "id"=$5',
    [body.name,body.address,body.phoneNumber, body.mail, body.id||res.locals.schoolId],(err,result)=>{
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
    })
};
const deleteSchool = (req, res, next) => {
    let body = req.body;
    pool.query('DELETE FROM public."Schools" WHERE "id"=$1',[body.id],(err,result)=>{
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
    })
};

module.exports = {
  getAllSchools,
  addSchool,
  updateSchool,
  deleteSchool,
};
