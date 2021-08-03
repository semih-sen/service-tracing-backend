const router = require("express").Router();

const {
  getAllNotifications, deleteNotification,
} = require("../../controllers/v1/notificationController");
const { getAccesToRouteForParents } = require("../../middlewares/auth/auth");
const { getAccessToParentsOwnStudent } = require("../../middlewares/auth/parentBasedVerification");
router.get("/", getAccesToRouteForParents,getAccessToParentsOwnStudent, getAllNotifications);
router.post("/delete", getAccesToRouteForParents,getAccessToParentsOwnStudent,deleteNotification)
module.exports = router;
