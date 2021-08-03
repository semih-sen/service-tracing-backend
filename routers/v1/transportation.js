const express = require("express");
const router=express.Router();

const {getAllTransportations,addTransportation,updateTransportation,deleteTransportation} = require("../../controllers/v1/transportationController")
const {controlTransportation} =require("../../middlewares/transportations/transportationMiddleware");


router.get('/',getAllTransportations)
router.post('/',controlTransportation,addTransportation)
router.put('/',updateTransportation)
router.delete('/',deleteTransportation)


module.exports =router;