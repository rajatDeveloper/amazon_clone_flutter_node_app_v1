const express = require("express");
const {
  authData,
  signUp,
  signin,
  tokenCheck,
} = require("../controller/authController");

const router = express.Router();

router.route("/data").get(authData);
router.route("/signup").post(signUp);
router.route("/signin").post(signin);
router.route("/token").post(tokenCheck);
module.exports = router;
