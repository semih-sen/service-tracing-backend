const express = require('express');

const router = express.Router();


const service = require('./service');
const student=require('./student');
const employee = require('./employee');
const user = require('./user');
const parent = require('./parent');
const school = require('./school');
const manager = require('./manager')
const menu = require("./menu");
const company = require("./company");
const rollcall = require('./rollCall');
const transportation = require("./transportation");
const notification= require("./notification");

router.use('/service',service);
router.use("/student",student);
router.use('/employee',employee);
router.use('/auth',user);
router.use('/parent',parent);
router.use('/school',school);
router.use("/manager",manager);
router.use("/menu",menu);
router.use("/company",company);
router.use("/rollcall",rollcall);
router.use("/transportation",transportation);
router.use("/notification",notification)

module.exports =router;