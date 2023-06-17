const express = require("express");
const auth = require("../middlewares/auth");
const { cart, removeFromCart, saveUserAddress } = require("../controller/userController");

const router = express.Router();

router.route("/add-to-cart").post(auth, cart);
router.route("/remove-from-cart/:id").delete(auth, removeFromCart);
router.route("/save-user-address").post(auth,saveUserAddress)  ; 
module.exports = router;
