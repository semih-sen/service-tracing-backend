const pool = require("../../helpers/database/database");

const getAllManagers = async (req, res, next) => {
  await pool
    .query('SELECT * FROM public."Managers"')
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of managers",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting parents. It is detail of the error: " +
          err.message,
      })
    );
};
const addManager = (req, res, next) => {
  let body = req.body;

  pool.query(
    `INSERT INTO public."Managers"("schoolId","name","phoneNumber","mail") VALUES($1,$2,$3,$4,$5)`,
    [body.schoolId,body.name, body.phoneNumber, body.mail],
    (err, data) => {
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

const updateManager = (req, res, next) => {
  let body = req.body;
  pool.query('UPDATE public."Managers" SET  "schoolId"=$1,"name" = $2,"phoneNumber" = $3,"mail"=$4 WHERE "id"=$5',
  [body.schoolId,body.name,body.phoneNumber,body.mail,body.id],(err,result)=>{
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

const deleteManager = (req, res, next) => {
  let body = req.body;
  pool.query('DELETE FROM public."Managers" WHERE "id"=$1',[body.id],(err,result)=>{
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

module.exports = { getAllManagers, addManager, updateManager, deleteManager };
