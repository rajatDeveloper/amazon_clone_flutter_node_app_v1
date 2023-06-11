const productModel = require("../models/productModel");

exports.postProduct = async (req, res, next) => {
  try {
    const { name, price, description, category, quantity, images } = req.body;
    let product = productModel({
      name,
      price,
      description,
      category,
      quantity,
      images,
    });
    product = await product.save();

    res.status(200).json(product);
  } catch (error) {
    res.status(500).json({
      error: e.message,
    });
  }
};

exports.getProducts = async (req, res, next) => {
  try {
    const products = await productModel.find({});

    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({
      error: e.message,
    });
  }
};

exports.deleteProduct = async (req, res, next) => {
  try {
    const { id } = req.body;
    let product = await productModel.findByIdAndDelete(id);

    res.status(200).json(product);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};
