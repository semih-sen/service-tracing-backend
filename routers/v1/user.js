const express = require("express");

const router = express.Router();

const {getAllUsers,addUser,updateUser,deleteUser,login,resetPassword} = require("../../controllers/v1/userController");

const {getAccesToRouteForAdmins, getAccesToRouteForAdminsEmployeesAndParents}=require("../../middlewares/auth/auth");

router.get('/',getAccesToRouteForAdmins,getAllUsers);
router.post('/login',login)
router.post('/register',addUser);
router.post("/resetPassword", getAccesToRouteForAdminsEmployeesAndParents,resetPassword)
router.put('/',updateUser);
router.delete('/',deleteUser);

module.exports =router;