const {DB_USERNAME,DB_HOST_NAME,DB_NAME,DB_PASSWORD,DB_PORT} = process.env;

const Pool =require("pg").Pool;
const pool = new Pool({
//     user:process.env.DB_USERNAME.toString(),
//     host:process.env.DB_HOST_NAME.toString(),
//     database:process.env.DB_NAME.toString(),
//     password:process.env.DB_PASSWORD.toString(),
//     port:process.env.DB_PORT,
    user:"postgres",
    host:"localhost",
    database:"ServiceTracingDb",
    password:"2956",
    port:5432

 });

 

module.exports =pool;