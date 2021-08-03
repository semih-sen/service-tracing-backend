const pool = require("../../helpers/database/database");

const getAllTransportations= async (req, res, next) => {
    await pool.query('SELECT * FROM public."Transportations"').then((jsonData) =>
    res.status(200).json({
      data: jsonData.rows,
      message: "List of transportations",
    })
  )
  .catch((err) =>
    res.status(400).json({
      message:
        "An error occurred while getting transportations. It is detail of the error: " +
        err.message,
    })
  );
}
const addTransportation=  (req, res, next) => {
   let body = req.body;
   pool.query('INSERT INTO public."Transportations"("studentId","serviceId","employeeId","type","datetime","isOutOfAddress") VALUES($1,$2,$3,$4,$5,$6)',
   [
        body.studentId,
        body.serviceId,
        body.employeeId,
        body.type,
        new Date(),
        body.isOutOfAddress
   ],(err, result) => {
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
  }) 
}
const updateTransportation=  (req, res, next) => {
    
}
const deleteTransportation=  (req, res, next) => {
    
}

module.exports = {getAllTransportations,addTransportation,updateTransportation,deleteTransportation}