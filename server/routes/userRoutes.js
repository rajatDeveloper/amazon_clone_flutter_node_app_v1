const express = require("express");
const auth = require("../middlewares/auth");
const {
  cart,
  removeFromCart,
  saveUserAddress,
  placeOrder,
  myOrders,
} = require("../controller/userController");

const router = express.Router();

router.route("/add-to-cart").post(auth, cart);
router.route("/remove-from-cart/:id").delete(auth, removeFromCart);
router.route("/save-user-address").post(auth, saveUserAddress);
router.route("/place-order").post(auth, placeOrder);

router.route("/orders/me").get(auth, myOrders);

module.exports = router;
