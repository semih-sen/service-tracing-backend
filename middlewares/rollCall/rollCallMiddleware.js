const pool = require("../../helpers/database/database");
const moment = require("moment");
moment.locale("tr");

const controlRollCall = (req, res, next) => {
  let body = req.body;
  pool.query(
    `SELECT * FROM public."rollcalls" where "studentid"=$1 and "type"=$2 and "datetime">(SELECT NOW() - interval '15 minutes' limit 1)`,
    [body.studentId, body.type],
    (err, result) => {
      if (err) {
        console.error(err);
      } else {
        if (result.rowCount > 0) {
          pool.query(
            'UPDATE public."rollcalls" SET "status"=$1 WHERE "id"=$2',
            [body.status, result.rows[0].id],
            (err, result2) => {
              if (err) {
                console.error(err);
              } else {
                res.status(200).json({
                  message: "Succesfully updated",
                });
              }
            }
          );
          pool.query(
            'SELECT * from notifications where "studentId"=$1 order by id desc limit 1',
            [body.studentId],
            (err, result2) => {
              if (err) console.log(err);
              else {
                pool.query(
                  `Select * from "Students" where id=$1`,
                  [result2.rows[0].studentId],
                  (err, result3) => {
                    if (err) console.log(err);
                    else {
                      pool.query(
                        "Update notifications set content=$1, title=$2 where id=$3",
                        [
                          body.status == "true"
                            ? `Öğrenciniz ${
                                result3.rows[0].name
                              } servise binmiştir\nİşlem tarihi: ${moment().format(
                                "LLLL"
                              )}`
                            : `Öğrenciniz ${
                                result3.rows[0].name
                              } servise binmemiştir\nİşlem tarihi: ${moment().format(
                                "LLLL"
                              )}`,

                          body.status == "true"
                            ? "Öğrenciniz servise bindi"
                            : "Öğrenciniz servise binmedi",
                          result2.rows[0].id,
                        ],
                        (err, result4) => {}
                      );
                    }
                  }
                );
              }
            }
          );
        } else {
          next();
        }
      }
    }
  );
};

module.exports = {
  controlRollCall,
};
