const pool = require("../../helpers/database/database");

const getAllEmployees = async (req, res, next) => {
  if (req.query.plate) {
    await pool
      .query('SELECT * FROM public."Employees" WHERE "schoolId"=$1', [
        res.locals.schoolId,
      ])
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
  }
  else if (req.query.id){
    await pool
    .query('SELECT * FROM public."Employees" WHERE "schoolId"=$1 and "id"=$2', [
      res.locals.schoolId,req.query.id
    ])
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
  }
  else {
    await pool
      .query('SELECT * FROM public."Employees" WHERE "schoolId"=$1', [
        res.locals.schoolId,
      ])
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
  }
};
const addEmployee = (req, res, next) => {
  let body = req.body;
  pool.query(
    'INSERT INTO public."Employees" ("schoolId","companyId","serviceId","name","phoneNumber","mail") VALUES ($1,$2,$3,$4,$5,$6)',
    [
      res.locals.schoolId,
      body.companyId,
      body.serviceId,
      body.name,
      body.phoneNumber,
      body.mail,
    ],
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
    'UPDATE public."Employees" SET "serviceId"=$1, "companyId"=$2, "schoolId"=$3, "name"=$4, "phoneNumber"=$5, "mail"=$6 WHERE "id"=$7',
    [
      body.serviceId,
      body.companyId,
      body.schoolId,
      body.name,
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
