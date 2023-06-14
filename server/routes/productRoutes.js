const express = require("express");
const auth = require("../middlewares/auth");
const {
  getProductsCatergory,
  getSearchedProducts,
} = require("../controller/productController");

const router = express.Router();

router.route("/get-products-category").get(auth, getProductsCatergory);
// get-searched-products
router.route("/get-searched-products/:name").get(auth, getSearchedProducts);
module.exports = router;
