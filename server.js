const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const helmet = require('helmet');
const http = require("http");
const WebSocket = require("ws");


const routers = require("./routers/index");

dotenv.config({
  path: "./config/env/config.env",
});

const app = express();
app.use(cors());
app.use(helmet());
app.use(express.json());
app.use("/api", routers);

const server = http.createServer(app);



const PORT = process.env.PORT;


server.listen(PORT, () => {
  console.log(
    "\x1b[33m",
    `App started on ${PORT} and environment is ${process.env.NODE_ENV}`
  );
});
