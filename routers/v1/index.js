const express = require('express');

const router = express.Router();
console.log("router çalıştı index2");

const service = require('./service');
const student=require('./student');
const employee = require('./employee');
const user = require('./user');
const parent = require('./parent');
const school = require('./school');
const manager = require('./manager')

router.use('/service',service);
router.use("/student",student);
router.use('/employee',employee);
router.use('/auth',user);
router.use('/parent',parent);
router.use('/school',school);
router.use("/manager",manager);

module.exports =router;