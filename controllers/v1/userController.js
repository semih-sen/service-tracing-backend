const pool = require("../../helpers/database/database");

const { sendTokenToClient } = require("../../helpers/auth/tokenHelper");
const crypto = require("crypto");

const getAllUsers = async (req, res, next) => {
  await pool
    .query('SELECT "id","name","mail","phoneNumber","role" FROM public."Users"')
    .then((jsonData) =>
      res.status(200).json({
        data: jsonData.rows,
        message: "List of users without passwords",
      })
    )
    .catch((err) =>
      res.status(400).json({
        message:
          "An error occurred while getting users. This is error details :" +
          err.message,
      })
    );
};
const addUser = async (req, res, next) => {
  let body = req.body;
  const hash = crypto.createHash("sha512");
  let passHash = hash.update(body.password).digest("hex");
  await pool.query(
    'INSERT INTO public."Users"("name","mail","phoneNumber","password","role") VALUES($1,$2,$3,$4,$5)',
    [body.name, body.mail, body.phoneNumber, passHash, body.role],
    (err, result) => {
      if (err) {
        res.status(400).json({
          message:
            "An error occurred while adding. This is error details :" +
            err.message,
        });
        console.error(err);
      } else {
        sendTokenToClient(
          {
            mail: body.mail,
            name: body.name,
            mail: body.mail,
            role: body.role,
          },
          res,
          200
        );
      }
    }
  );
};
const updateUser = async (req, res, next) => {};
const deleteUser = async (req, res, next) => {};

const checkPassword = (password, hashedPassword) => {
  const hash = crypto.createHash("sha512");
  let passHash = hash.update(password).digest("hex");
  return passHash === hashedPassword;
};

const login = (req, res, next) => {
  let body = req.body;


  pool.query(
    'SELECT * FROM public."Users" WHERE "mail"=$1',
    [body.mail],
    (err, result) => {
      if (err) {
        console.error(err);
      }
      let user;
     
      if (result.rowCount > 0) {
        user = result.rows[0];
      }
      else{
        res
        .status(401)
        .json({ success: false, message: "Check your email or password" });
      }
     

      if (user != undefined) {
        if (checkPassword(body.password, user.password)) {
          sendTokenToClient(user, res, 200);
        } else {
          res
            .status(401)
            .json({ success: false, message: "Check your email or password" });
        }
      }
    }
  );
};

const resetPassword = (req, res) => {
  let body = req.body;
  pool.query(`SELECT * FROM "Users" Where mail=$1`,[body.mail],(err,result)=>{
    if(err){
      res.status(500).json({
        message:err.message
      })
    }
    else{
     
      if(result.rowCount > 0){
         let user=result.rows[0];
         if(checkPassword(body.old,user.password)){
            const hash = crypto.createHash("sha512");
             let passHash = hash.update(body.new).digest("hex");
             pool.query(`Update "Users" set password=$1 where id=$2`,[passHash,user.id],(err,result)=>{
               if(!err){
                 res.status(200).json({
                   message:"Successfully changed"
                 })
               }
             })
         }
      }else{
        res.status(400,"Check your email");
      }

    }
  })
}

module.exports = { getAllUsers, addUser, updateUser, deleteUser, login,resetPassword };
