const express = require("express");
const auth = require("../middlewares/auth");
const {
  authData,
  signUp,
  signin,
  tokenCheck,
  getUserData,
} = require("../controller/authController");

const router = express.Router();

router.route("/signup").post(signUp);
router.route("/signin").post(signin);
router.route("/token").post(tokenCheck);
router.route("/getUserData").get( auth, getUserData)
module.exports = router;
