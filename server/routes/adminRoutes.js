const express = require("express");
const auth = require("../middlewares/auth");
const {
  postProduct,
  getProducts,
  deleteProduct,
} = require("../controller/adminController");
const admin = require("../middlewares/admin");

const router = express.Router();

router.route("/add-product").post(admin, postProduct);

router.route("/get-products").get(admin, getProducts);

router.route("/delete-product").post(admin, deleteProduct);
module.exports = router;
