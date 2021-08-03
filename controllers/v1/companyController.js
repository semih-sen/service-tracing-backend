const pool = require("../../helpers/database/database");

const getAllCompanies = async (req, res, next) => {

  if(req.query.id){
    await pool
    .query('SELECT * FROM public."Companies" WHERE "schoolId"=$1 and "id"=$2', [
      res.locals.schoolId,
      req.query.id
    ])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of companies",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting companies. It is detail of the error: " +
          err.message,
      })
    );
  }else{
  await pool
    .query('SELECT * FROM public."Companies" WHERE "schoolId"=$1', [
      res.locals.schoolId,
    ])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of companies",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting companies. It is detail of the error: " +
          err.message,
      })
    );}
};
const addCompany = (req, res, next) => {
  let body = req.body;

  pool.query(
    'INSERT INTO public."Companies"("schoolId","companyName","managerName","phoneNumber","mail","address") VALUES($1,$2,$3,$4,$5,$6)',
    [
      res.locals.schoolId,
      body.companyName,
      body.managerName,
      body.phoneNumber,
      body.mail,
      body.address,
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
          pool
            .query(
              'SELECT "id" FROM public."Companies" ORDER BY "id" DESC LIMIT 1'
            )
            .then((value) => {
              res.status(200).json({
                message: "Succesfully added",
                data: value.rows[0].id,
              });
            });
        }
      
    }
  );
};
const updateCompany = (req, res, next) => {};
const deleteCompany = (req, res, next) => {};

module.exports = { getAllCompanies, addCompany, updateCompany, deleteCompany };