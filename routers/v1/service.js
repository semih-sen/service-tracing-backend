const express = require('express');

const {getAllServices,addService,updateService,deleteService} =require('../../controllers/v1/serviceController');
const {getAccessToManagersOwnSchool}=require("../../middlewares/auth/schoolBasedVerification")

const {getAccesToRouteForAdmins,getAccesToRouteForAdminsAndEmployees,}=require("../../middlewares/auth/auth");

const router = express.Router();
router.get('/',getAccesToRouteForAdminsAndEmployees,getAccessToManagersOwnSchool,getAllServices);
router.post('/',getAccesToRouteForAdmins,getAccessToManagersOwnSchool,addService);
router.put('/',getAccesToRouteForAdmins,getAccessToManagersOwnSchool,updateService);
router.delete('/',getAccesToRouteForAdmins,deleteService);

module.exports=router;