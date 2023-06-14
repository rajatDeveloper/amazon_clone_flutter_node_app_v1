const productModel = require("../models/productModel");

exports.getProductsCatergory = async (req, res, next) => {
  try {
    console.log(req.query.category);

    const products = await productModel.find({ category: req.query.category });

    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.getSearchedProducts = async (req, res, next) => {
  try {
    // console.log(req.params.name);

    const products = await productModel.find({
      name: { $regex: req.params.name, $options: "i" },
    });

    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};
