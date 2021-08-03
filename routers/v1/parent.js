const express = require('express');

const router = express.Router();

const {getAllParents,getParentFromId,getLastParent,addParent,updateParent,deleteParent}=require('../../controllers/v1/parentController')

const {getAccesToRouteForSuperAdminsAndAdmins,
    getAccesToRouteForSuperAdminsAdminsAndEmployees}=require('../../middlewares/auth/auth');

    const {getAccessToManagersOwnSchool}=require("../../middlewares/auth/schoolBasedVerification")

router.get('/',getAccesToRouteForSuperAdminsAdminsAndEmployees,getAccessToManagersOwnSchool,getAllParents);
router.get('/:id',getAccesToRouteForSuperAdminsAdminsAndEmployees,getAccessToManagersOwnSchool,getParentFromId);
router.get('/',getAccesToRouteForSuperAdminsAdminsAndEmployees,getAccessToManagersOwnSchool,getLastParent);
router.post('/',getAccesToRouteForSuperAdminsAndAdmins,getAccessToManagersOwnSchool,addParent);
router.put("/",getAccesToRouteForSuperAdminsAndAdmins,updateParent);
router.delete("/",getAccesToRouteForSuperAdminsAndAdmins,deleteParent);

module.exports =router;