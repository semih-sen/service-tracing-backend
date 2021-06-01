const express = require("express");

const router = express.Router();

const {getAllEmployees,addEmployee,updateEmployee,deleteEmployee} = require("../../controllers/v1/employeeController");

router.get('/',getAllEmployees);
router.post('/',addEmployee);
router.put('/',updateEmployee);
router.delete('/',deleteEmployee);


module.exports =router;