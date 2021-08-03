const jwt = require("jsonwebtoken");
const pool = require("../../helpers/database/database");

const {
  isTokenIncluded,
  getAccesTokenFromHeader,
} = require("../../helpers/auth/tokenHelper");

const getAccessToManagersOwnSchool = (req, res, next) => {
 const { JWT_SECRET_KEY } = process.env;
  const access_token = getAccesTokenFromHeader(req);
  jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
    if (err) {
      res.status(401).json({ message: err.message });
      return;
    }
    if (decoded.role === "Manager") {
      let mail = decoded.mail;
      pool.query(
        'SELECT * FROM public."Managers" WHERE "mail"=$1',
        [mail],
        (err, result) => {
          if (err) {
              console.error(err);
              return;
          }
          let schoolId=result.rows[0].schoolId;
          res.locals.schoolId=schoolId;
          next();
        }
      );
    }
    else if(decoded.role === "Employee"){
      let mail = decoded.mail;
      pool.query(
        'SELECT * FROM public."Employees" WHERE "mail"=$1',
        [mail],
        (err, result) => {
          if (err) {
              console.error(err);
              return;
          }
          let schoolId=result.rows[0].schoolId;
          res.locals.schoolId=schoolId;
          
          next();
        }
      );
    }
  });
};

module.exports = { getAccessToManagersOwnSchool };
