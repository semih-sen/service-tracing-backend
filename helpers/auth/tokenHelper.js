const jwt = require("jsonwebtoken");
const pool = require("../database/database");

const getTokenFromUserModel = (user) => {
  const { JWT_SECRET_KEY, JWT_EXPIRE } = process.env;

  const payload = {
    mail: user.mail,
    name: user.name,
    role: user.role,
  };
  const token = jwt.sign(payload, JWT_SECRET_KEY, { expiresIn: JWT_EXPIRE });

  return token;
};

const sendTokenToClient = (user, res, status) => {
  // Get Token From User Model
  const token = getTokenFromUserModel(user);

  const { JWT_COOKIE_EXPIRE, NODE_ENV } = process.env;

  // Send To Client With Res
  

    if(user.role==="Employee"){
      let id;
      pool.query('SELECT "id","serviceId" from public."Employees" where "mail"=$1',[user.mail],(err,result)=>{
          if(err){
            console.error(err);
          }
          else{
            
            return res
            .status(status)
            .cookie("token", token, {
              httpOnly: true,
              expires: new Date(Date.now() + parseInt(JWT_COOKIE_EXPIRE) * 1000 * 60),
              secure: NODE_ENV === "development" ? false : true,
            })
            .json({
              success: true,
              token,
              data: {
                id: result.rows[0].id,
                serviceId: result.rows[0].serviceId,
                name: user.name,
                mail: user.mail,
                role: user.role,
              },
            });
          }
      });
      
    }
    else{
      
        return res
        .status(status)
        .cookie("token", token, {
          httpOnly: true,
          expires: new Date(Date.now() + parseInt(JWT_COOKIE_EXPIRE) * 1000 * 60),
          secure: NODE_ENV === "development" ? false : true,
        })
        .json({
          success: true,
          token,
          data: {
            name: user.name,
            mail: user.mail,
            role: user.role,
          },
        });
    }

 
};

const isTokenIncluded = (req) => {
  return (
    req.headers.authorization && req.headers.authorization.startsWith("Bearer:")
  );
};

const getAccesTokenFromHeader = (req) => {
  if (isTokenIncluded(req)) {
    const auth = req.headers.authorization;

    const acces_token = auth.split(" ")[1];

    return acces_token;
  }
  return "Error";
};

module.exports = {
  sendTokenToClient,
  isTokenIncluded,
  getAccesTokenFromHeader,
};
