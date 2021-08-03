const jwt = require("jsonwebtoken");
const pool = require("../../helpers/database/database");

const {
  isTokenIncluded,
  getAccesTokenFromHeader,
} = require("../../helpers/auth/tokenHelper");

const getAccessToParentsOwnStudent= (req, res, next) => {
 const { JWT_SECRET_KEY } = process.env;
  const access_token = getAccesTokenFromHeader(req);
  jwt.verify(access_token, JWT_SECRET_KEY, (err, decoded) => {
    if (err) {
      res.status(401).json({ message: err.message });
      return;
    }
    if (decoded.role === "Parent") {
      let mail = decoded.mail;
      pool.query(
        'SELECT * FROM public."Parents" WHERE "mail"=$1',
        [mail],
        (err, result) => {
          if (err) {
              console.error(err);
              return;
          }
          let parentId=result.rows[0].id;
          res.locals.parentId=parentId;
          next();
        }
      );
    }
   
  });
};

module.exports = { getAccessToParentsOwnStudent };
