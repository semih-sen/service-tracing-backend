const express = require("express");
const router=express.Router();

const {getAllTransportations,updateTransportation,deleteTransportation} = require("../../controllers/v1/transportationController")
const {controlTransportation} =require("../../middlewares/transportations/transportationMiddleware");
const {addTransportationToQueue} = require("../../messaging/transportation");
const {getAccesToRouteForAdminsEmployeesAndParents,getAccesToRouteForEmployees} = require("../../middlewares/auth/auth");
const {getAccessToManagersOwnSchool} = require("../../middlewares/auth/schoolBasedVerification");
const {getAccessToParentsOwnStudent} = require("../../middlewares/auth/parentBasedVerification");


router.get('/',getAccesToRouteForAdminsEmployeesAndParents,getAccessToManagersOwnSchool,getAllTransportations)
router.get('/parent',getAccesToRouteForAdminsEmployeesAndParents,getAccessToParentsOwnStudent,getAllTransportations)
router.post('/',getAccesToRouteForEmployees,controlTransportation,addTransportationToQueue)
router.put('/',updateTransportation)
router.delete('/',deleteTransportation)


module.exports =router;