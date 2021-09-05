const express = require("express");

const {
    getAllStudents,
    addStudent,
    updateStudent,
    deleteStudent,updateStudentOrderNumber, updateStudentOrderNumber2,getStudentDetail,getStudentsWithParentId
} = require("../../controllers/v1/studentController");

const {getAccesToRouteForAdmins,getAccesToRouteForAdminsAndEmployees,getAccesToRouteForAdminsAndParents,getAccesToRouteForParents}=require("../../middlewares/auth/auth");
const {getAccessToManagersOwnSchool}=require("../../middlewares/auth/schoolBasedVerification")
const {getAccessToParentsOwnStudent}=require("../../middlewares/auth/parentBasedVerification")

const router = express.Router();

router.get("/", getAccesToRouteForAdminsAndEmployees,getAccessToManagersOwnSchool,getAllStudents);
router.get("/detail", getAccesToRouteForAdminsAndEmployees,getAccessToManagersOwnSchool,getStudentDetail);
router.get("/parent",getAccesToRouteForParents,getAccessToParentsOwnStudent,getStudentsWithParentId)
router.post("/",getAccesToRouteForAdmins, addStudent);
router.put("/", getAccesToRouteForAdminsAndParents,updateStudent);
router.put("/ordernumber", getAccesToRouteForAdminsAndEmployees,updateStudentOrderNumber);
router.put("/ordernumber2", getAccesToRouteForAdminsAndEmployees,updateStudentOrderNumber2);
router.delete("/",getAccesToRouteForAdmins, deleteStudent);

module.exports = router;
