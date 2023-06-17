const express = require("express");
const auth = require("../middlewares/auth");
const { cart, removeFromCart } = require("../controller/userController");

const router = express.Router();

router.route("/add-to-cart").post(auth, cart);
router.route("/remove-from-cart/:id").delete(auth, removeFromCart);
module.exports = router;
