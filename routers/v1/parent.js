const express = require('express');

const router = express.Router();

const {getAllParents,addParent,updateParent,deleteParent}=require('../../controllers/v1/parentController')

const {getAccesToRouteForSuperAdminsAndAdmins,
    getAccesToRouteForSuperAdminsAdminsAndEmployees}=require('../../middlewares/auth/auth');

router.get('/',getAccesToRouteForSuperAdminsAdminsAndEmployees,getAllParents);
router.post('/',getAccesToRouteForSuperAdminsAndAdmins,addParent);
router.put("/",getAccesToRouteForSuperAdminsAndAdmins,updateParent);
router.delete("/",getAccesToRouteForSuperAdminsAndAdmins,deleteParent);

module.exports =router;