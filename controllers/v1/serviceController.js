const pool = require("../../helpers/database/database");

const getAllServices = async (req, res, next) => {
  if(req.query.companyid){
    let companyId = req.query.companyid
    await pool
    .query('SELECT * FROM public."Services" WHERE "schoolId"=$1 and "companyId"=$2', [
      res.locals.schoolId,
      companyId
    ])
    .then((jsonData) => {
      res.status(200).json({
        data: jsonData.rows,
        message: "List of services",
      });
    })
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting services. This is error details :" +
          err.message,
      })
    );
  }
  else if(req.query.serviceId){
    await pool
    .query('SELECT * FROM public."Services" WHERE "schoolId"=$1 and "id"=$2', [
      res.locals.schoolId,
      req.query.serviceId
    ])
    .then((jsonData) => {
      res.status(200).json({
        data: jsonData.rows,
        message: "List of services",
      });
    })
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting services. This is error details :" +
          err.message,
      })
    );
  }
  else{
    await pool
    .query('SELECT * FROM public."Services" WHERE "schoolId"=$1', [
      res.locals.schoolId
    ])
    .then((jsonData) => {
      res.status(200).json({
        data: jsonData.rows,
        message: "List of services",
      });
    })
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting services. This is error details :" +
          err.message,
      })
    );
  }
  
};

const addService = async (req, res, next) => {

  let body = req.body;
  await pool.query(
    'INSERT INTO public."Services" ("schoolId","companyId","name","plate") VALUES ($1,$2,$3,$4)',
    [res.locals.schoolId, body.companyId, body.name, body.plate],
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

const updateService = async (req, res, next) => {
  let body = req.body;
  await pool.query(
    'UPDATE public."Services" SET "name"=$1, "plate"=$2, "schoolId"=$3, "companyId"=$4 WHERE "id"=$5',
    [body.name, body.plate, res.locals.schoolId,body.companyId, body.id],
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

const deleteService = async (req, res, next) => {
  let body = req.body;
  await pool.query(
    'DELETE FROM public."Services" WHERE "id"=$1',
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

module.exports = { getAllServices, addService, updateService, deleteService };
