const express = require("express");
const router=express.Router();

const {getAllManagers,addManager,updateManager,deleteManager}=require('../../controllers/v1/managerController')

const {getAccesToRouteForSuperAdminsAndAdmins,
    getAccesToRouteForSuperAdminsAdminsAndEmployees}=require('../../middlewares/auth/auth');

router.get('/',getAccesToRouteForSuperAdminsAdminsAndEmployees,getAllManagers);
router.post('/',getAccesToRouteForSuperAdminsAndAdmins,addManager);
router.put("/",getAccesToRouteForSuperAdminsAndAdmins,updateManager);
router.delete("/",getAccesToRouteForSuperAdminsAndAdmins,deleteManager);

module.exports =router;