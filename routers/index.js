const express = require('express');
const router = express.Router();
const version1 = require('./v1/index');

console.log("router çalıştı index1");

router.use('/v1', version1);

module.exports =router;