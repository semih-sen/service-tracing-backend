const express = require("express");
const router = express.Router();

const {getAccesToRouteForAdminsEmployeesAndParents,getAccesToRouteForEmployees,}=require("../../middlewares/auth/auth");
const {getRollCalls,updateRollCall,deleteRollCall} =require("../../controllers/v1/rollCallController")
const {controlRollCall} =require("../../middlewares/rollCall/rollCallMiddleware");
const {addRollCallToQueue} =require("../../messaging/rollCall")

router.get("/",getAccesToRouteForAdminsEmployeesAndParents,getRollCalls);
router.post("/",getAccesToRouteForEmployees,controlRollCall,addRollCallToQueue);
router.put("/",updateRollCall);
router.delete("/",deleteRollCall);

module.exports =router;
