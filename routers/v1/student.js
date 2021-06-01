const express = require("express");

const {
    getAllStudents,
    addStudent,
    updateStudent,
    deleteStudent
} = require("../../controllers/v1/studentController");

const {getAccesToRouteForAdmins,getAccesToRouteForAdminsAndEmployees}=require("../../middlewares/auth/auth");

const router = express.Router();

router.get("/", getAccesToRouteForAdminsAndEmployees,getAllStudents);
router.post("/",getAccesToRouteForAdmins, addStudent);
router.put("/", getAccesToRouteForAdmins,updateStudent);
router.delete("/",getAccesToRouteForAdmins, deleteStudent);

module.exports = router;
