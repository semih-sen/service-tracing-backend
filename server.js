const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");


const routers = require("./routers/index");

dotenv.config({
  path: "./config/env/config.env",
});

const app = express();
const PORT = process.env.PORT;

app.use(express.json());
app.use(cors());
/*
var crypto = require("crypto");
var id = crypto.randomBytes(4).toString("hex");
console.log(id);*/

app.use("/api", routers);
app.listen(PORT, () => {
  console.log(
    "\x1b[33m",
    `App started on ${PORT} and environment is ${process.env.NODE_ENV}`
  );
});
