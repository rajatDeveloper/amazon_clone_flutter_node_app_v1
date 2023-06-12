const express = require("express");
const auth = require("../middlewares/auth");
const { getProductsCatergory } = require("../controller/productController");

const router = express.Router();

router.route("/get-products-category").get(auth, getProductsCatergory);

module.exports = router;
