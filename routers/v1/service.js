const express = require('express');

const {getAllServices,addService,updateService,deleteService} =require('../../controllers/v1/serviceController');

const router = express.Router();
console.log("router çalıştı service");
router.get('/',getAllServices);
router.post('/',addService);
router.put('/',updateService);
router.delete('/',deleteService);

module.exports=router;