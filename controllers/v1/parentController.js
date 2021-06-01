const pool = require("../../helpers/database/database");

const getAllParents = async (req, res, next) => {
  await pool
    .query('SELECT * FROM public."Parents"')
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of parents",
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
const addParent = (req, res, next) => {
  let body = req.body;

  pool.query(
    `INSERT INTO public."Parents"("name","phoneNumber","mail") VALUES($1,$2,$3,$4)`,
    [body.name, body.phoneNumber, body.mail],
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

const updateParent = (req, res, next) => {
  let body = req.body;
  pool.query('UPDATE public."Parents" SET "name" = $1,"phoneNumber" = $2,"mail"=$3 WHERE "id"=$4',
  [body.name,body.phoneNumber,body.mail,body.id],(err,result)=>{
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

const deleteParent = (req, res, next) => {
  let body = req.body;
  pool.query('DELETE FROM public."Parents" WHERE "id"=$1',[body.id],(err,result)=>{
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

module.exports = { getAllParents, addParent, updateParent, deleteParent };
