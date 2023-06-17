const { Product } = require("../models/productModel");

exports.getProductsCatergory = async (req, res, next) => {
  try {
    console.log(req.query.category);

    const products = await Product.find({ category: req.query.category });

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

    const products = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });

    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.rateProduct = async (req, res, next) => {
  try {
    // console.log(req.params.name);
    const { id, rating } = req.body;
    let product = await Product.findById(id);

    for (let i = 0; i < product.ratings.length; i++) {
      if (product.ratings[i].userId === req.user) {
        product.ratings.splice(i, 1);
        break;
      }
    }

    const ratingSchema = {
      userId: req.user,
      rating,
    };

    product.ratings.push(ratingSchema);
    product = await product.save();

    res.status(200).json(product);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.getDealOfDay = async (req, res, next) => {
  try {
    // console.log(req.params.name);

    let products = await Product.find({});

    products = products.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;
      for (let i = 0; i < a.ratings.length; i++) {
        aSum += a.ratings[i].rating;
      }
      for (let i = 0; i < b.ratings.length; i++) {
        bSum += b.ratings[i].rating;
      }
      return aSum < bSum ? 1 : -1;
    });

    res.status(200).json(products[0]);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};
