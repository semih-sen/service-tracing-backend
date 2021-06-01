const express = require("express");

const router =express.Router();

const {getAllSchools,addSchool,updateSchool,deleteSchool}=require("../../controllers/v1/schoolController");

const {getAccesToRouteForSuperAdmins,
    getAccesToRouteForSuperAdminsAndAdmins,}=require("../../middlewares/auth/auth")

const {getAccessToManagersOwnSchool}=require("../../middlewares/auth/schoolBasedVerification")



router.get('/',getAccesToRouteForSuperAdminsAndAdmins,getAccessToManagersOwnSchool,getAllSchools);
router.post('/',getAccesToRouteForSuperAdmins,addSchool);
router.put('/',getAccesToRouteForSuperAdminsAndAdmins,updateSchool);
router.delete('/',getAccesToRouteForSuperAdmins,deleteSchool);

module.exports =router;