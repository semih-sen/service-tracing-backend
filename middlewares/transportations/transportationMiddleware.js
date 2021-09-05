const pool = require("../../helpers/database/database");
const moment = require("moment");
moment.locale("tr");
const controlTransportation = (req, res, next) => {
  let body = req.body;
  pool.query(
    `SELECT * FROM public."Transportations" where "studentId"=$1 and "type"=$2 and "datetime">(SELECT NOW() - interval '15 minutes' limit 1)`,
    [body.studentId, body.type],
    (err, result) => {
      if (err) {
        console.error(err);
      } else {
        if (result.rowCount > 0) {
          pool.query(
            'UPDATE public."Transportations" SET "isOutOfAddress"=$1 WHERE "id"=$2',
            [body.isOutOfAddress, result.rows[0].id],
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
                        "Update notifications set content=$1 where id=$2",
                        [
                          body.type == "Evden Okula"
                            ? `Öğrenciniz ${
                                result3.rows[0].name
                              } okulda iniş yapmıştır\nİşlem tarihi: ${moment().format(
                                "LLLL"
                              )}`
                            : body.isOutOfAddress
                            ? `Öğrenciniz ${
                                result3.rows[0].name
                              } adres dışı iniş yapmıştır\nİşlem tarihi: ${moment().format(
                                "LLLL"
                              )}`
                            : `Öğrenciniz ${
                                result3.rows[0].name
                              } evinde iniş yapmıştır\nİşlem tarihi: ${moment().format(
                                "LLLL"
                              )}`,
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
  controlTransportation,
};
