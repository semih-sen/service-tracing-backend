const express = require("express");

const router = express.Router();

const {getAccesToRouteForAdmins,getAccesToRouteForAdminsAndEmployees,}=require("../../middlewares/auth/auth");
const {getAccessToManagersOwnSchool}=require("../../middlewares/auth/schoolBasedVerification")

const {getAllCompanies,addCompany,updateCompany,deleteCompany} =require("../../controllers/v1/companyController")

router.get("/",getAccesToRouteForAdminsAndEmployees,getAccessToManagersOwnSchool,getAllCompanies)
router.post("/",getAccesToRouteForAdminsAndEmployees,getAccessToManagersOwnSchool,addCompany)
router.put("/",getAccesToRouteForAdminsAndEmployees,getAccessToManagersOwnSchool,updateCompany)
router.delete("/",getAccesToRouteForAdminsAndEmployees,getAccessToManagersOwnSchool,deleteCompany)

module.exports =router;