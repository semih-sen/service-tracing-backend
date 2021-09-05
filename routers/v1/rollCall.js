const express = require("express");
const router = express.Router();

const {getAccesToRouteForAdminsEmployeesAndParents,getAccesToRouteForEmployees,}=require("../../middlewares/auth/auth");
const {getRollCalls,updateRollCall,deleteRollCall,getRollCallDetails,getRollCallForManager} =require("../../controllers/v1/rollCallController")
const {controlRollCall} =require("../../middlewares/rollCall/rollCallMiddleware");
const {addRollCallToQueue} =require("../../messaging/rollCall")
const {getAccessToParentsOwnStudent} = require("../../middlewares/auth/parentBasedVerification")
const {getAccessToManagersOwnSchool} = require("../../middlewares/auth/schoolBasedVerification")

router.get("/",getAccesToRouteForAdminsEmployeesAndParents,getRollCalls);
router.get("/forManagers",getAccesToRouteForAdminsEmployeesAndParents,getAccessToManagersOwnSchool,getRollCallForManager);
router.get("/detail",getAccesToRouteForAdminsEmployeesAndParents,getAccessToParentsOwnStudent,getRollCallDetails);
router.post("/",getAccesToRouteForEmployees,controlRollCall,addRollCallToQueue);
router.put("/",updateRollCall);
router.delete("/",deleteRollCall);

module.exports =router;
