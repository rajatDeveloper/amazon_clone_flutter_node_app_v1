const express = require("express");
const auth = require("../middlewares/auth");
const {
  getProductsCatergory,
  getSearchedProducts,
  rateProduct,
  getDealOfDay,
} = require("../controller/productController");

const router = express.Router();

router.route("/get-products-category").get(auth, getProductsCatergory);
// get-searched-products
router.route("/get-searched-products/:name").get(auth, getSearchedProducts);

router.route("/rate-product").post(auth, rateProduct);

router.route("/deal-of-the-day").get(auth, getDealOfDay);

module.exports = router;
