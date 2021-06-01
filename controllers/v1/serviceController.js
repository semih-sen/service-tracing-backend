const pool = require("../../helpers/database/database");

const getAllServices = async (req, res, next) => {
  console.log("ÇAlıştı");
  await pool
    .query('SELECT * FROM public."Services"')
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
};

const addService = async (req, res, next) => {
  let now = new Date();
  now.toISOString().split("T")[0];
  let body = req.body;
  console.log(body);
  await pool.query(
    'INSERT INTO public."Services" ("name","plate","dateOfUpload") VALUES ($1,$2,$3)',
    [body.name, body.plate, now],
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
    'UPDATE public."Services" SET "name"=$1, "plate"=$2, "dateOfUpload"=$3 WHERE "id"=$4',
    [body.name, body.plate, body.dateOfUpload, body.id],
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
