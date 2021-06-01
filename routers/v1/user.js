const express = require("express");

const router = express.Router();

const {getAllUsers,addUser,updateUser,deleteUser,login} = require("../../controllers/v1/userController");

const {getAccesToRouteForAdmins,getAccesToRouteForAdminsAndEmployees}=require("../../middlewares/auth/auth");

router.get('/',getAccesToRouteForAdmins,getAllUsers);
router.post('/login',login)
router.post('/register',addUser);
router.put('/',updateUser);
router.delete('/',deleteUser);

module.exports =router;