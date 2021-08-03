const express = require("express");

const router = express.Router();

const {getAllEmployees,addEmployee,updateEmployee,deleteEmployee} = require("../../controllers/v1/employeeController");

const {getAccesToRouteForAdmins,getAccesToRouteForAdminsAndEmployees,}=require("../../middlewares/auth/auth");
const {getAccessToManagersOwnSchool}=require("../../middlewares/auth/schoolBasedVerification")

router.get('/',getAccesToRouteForAdmins,getAccessToManagersOwnSchool,getAllEmployees);
router.post('/',getAccesToRouteForAdmins,getAccessToManagersOwnSchool,addEmployee);
router.put('/',updateEmployee);
router.delete('/',deleteEmployee);


module.exports =router;