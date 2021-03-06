const pool = require("../../helpers/database/database");

const getAllParents = async (req, res, next) => {
  if (req.query.last) {
    await pool
      .query('SELECT "id" FROM public."Parents" ORDER BY "id" DESC LIMIT 1')
      .then((jsonData) =>
        res.status(200).json({
          id: jsonData.rows[0].id,
        })
      )
      .catch((err) => {
        console.log(err.message);
        res.status(400).json({
          message:
            "An error occurred while getting parents. It is detail of the error: " +
            err.message,
        });
      });
  } else {
    await pool
      .query('SELECT * FROM public."Parents"')
      .then((jsonData) =>
        res.status(200).json({
          data: jsonData.rows,
          message: "List of parents",
        })
      )
      .catch((err) => {
        console.log(err.message);
        res.status(400).json({
          message:
            "An error occurred while getting parents. It is detail of the error: " +
            err.message,
        });
      });
  }
};

const getParentFromId = async (req, res, next) => {
  let id = req.params.id;
  await pool
    .query('SELECT * FROM public."Parents" WHERE "id"=$1', [id])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of parents from id",
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
    `INSERT INTO public."Parents"("name","phoneNumber","mail","address","note") VALUES($1,$2,$3,$4,$5)`,
    [body.name, body.phoneNumber, body.mail, body.address, body.note],
    (err, data) => {
      if (err) {
        console.error(err);
        res.status(400).json({
          message:
            "An error occurred while adding. It is detail of the error: " +
            err.message,
        });
      } else {
        pool
          .query('SELECT "id" FROM public."Parents" ORDER BY "id" DESC LIMIT 1')
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

const updateParent = (req, res, next) => {
  let body = req.body;
  pool.query(
    'UPDATE public."Parents" SET "name" = $1,"phoneNumber" = $2,"mail"=$3,"address"=$4, "note"$5 WHERE "id"=$6',
    [body.name, body.phoneNumber, body.mail, body.address, body.note, body.id],
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

const deleteParent = (req, res, next) => {
  let body = req.body;
  pool.query(
    'DELETE FROM public."Parents" WHERE "id"=$1',
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
        } else {
          res.status(400).json({
            message: "Not found",
          });
        }
      }
    }
  );
};

const getLastParent = () => {
  pool
    .query('SELECT "id" FROM public."Parents" ORDER BY "id" DESC LIMIT 1')
    .then((jsonData) => {
      return jsonData.rows[0].id;
    });
};

module.exports = {
  getAllParents,
  getParentFromId,
  getLastParent,
  addParent,
  updateParent,
  deleteParent,
};
