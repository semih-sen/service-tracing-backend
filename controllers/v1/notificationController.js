const pool = require("../../helpers/database/database");

const getAllNotifications = async (req,res,next)=>{
    await pool.query('SELECT * FROM "notifications" WHERE "parentId"=$1 ORDER BY "id" DESC',[res.locals.parentId])
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of notifications",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting notifications. This is error details :" +
          err.message,
      })
    );
}

const deleteNotification = (req, res, next) =>{

  pool.query('DELETE FROM public."notifications" WHERE "id"=$1',[req.body.id],(err, result) => {
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
  });

}

module.exports ={
    getAllNotifications,deleteNotification
}