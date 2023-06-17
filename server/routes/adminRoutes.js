const express = require("express");
const auth = require("../middlewares/auth");
const {
  postProduct,
  getProducts,
  deleteProduct,
  getOrders,
  getEarning,
} = require("../controller/adminController");
const admin = require("../middlewares/admin");

const router = express.Router();

router.route("/add-product").post(admin, postProduct);

router.route("/get-products").get(admin, getProducts);

router.route("/delete-product").post(admin, deleteProduct);

router.route("/get-orders").get(admin, getOrders);
router.route("/analytics").get(admin, getEarning);
module.exports = router;
