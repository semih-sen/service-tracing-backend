const pool = require("../../helpers/database/database");

const getAllEmployees = async (req, res, next) => {
  await pool
    .query('SELECT * FROM public."Employees"')
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of employees",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting employees. This is error details :" +
          err.message,
      })
    );
};
const addEmployee = (req, res, next) => {
  let body = req.body;
  let now = new Date();
  now.toISOString().split("T")[0];
  pool.query(
    'INSERT INTO public."Employees" ("serviceId","name","dateOfUpload","phoneNumber","mail") VALUES ($1,$2,$3,$4,$5)',
    [body.serviceId, body.name, now, body.phoneNumber, body.mail],
    (err, result) => {
      if (err) {
        res.status(400).json({
          message:
            "An error occurred while adding. This is error details :" +
            err.message,
        });
        console.error(err);
      } else {
        res.status(200).json({
          message: "Succesfully Added",
        });
      }
    }
  );
};
const updateEmployee = async (req, res, next) => {
  let body = req.body;
  await pool.query(
    'UPDATE public."Employees" SET "serviceId"=$1, "name"=$2,"dateOfUpload"=$3,"phoneNumber"=$4,"mail"=$5 WHERE "id"=$6',
    [
      body.serviceId,
      body.name,
      body.dateOfUpload,
      body.phoneNumber,
      body.mail,
      body.id,
    ],
    (err, result) => {
      if (err) {
        res.status(400).json({
          message:
            "An error occurred while updating. This is error details :" +
            err.message,
        });
        console.error(err);
      } else {
        res.status(200).json({
          message: "Succesfully Updated",
        });
      }
    }
  );
};
const deleteEmployee = async (req, res, next) => {
  let body = req.body;
  await pool.query(
    'DELETE FROM public."Employees" WHERE "id"=$1',
    [body.id],
    (err, result) => {
      if (err) {
        res.status(400).json({
          message:
            "An error occurred while deleting. This is error details :" +
            err.message,
        });
        console.error(err);
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
  getAllEmployees,
  addEmployee,
  updateEmployee,
  deleteEmployee,
};
