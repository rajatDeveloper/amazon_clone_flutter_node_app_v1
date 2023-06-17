const { Product } = require("../models/productModel");

const User = require("../models/userModel");

exports.cart = async (req, res, next) => {
  try {
    const { id } = req.body;
    let product = await Product.findById(id);

    let user = await User.findById(req.user);

    if (user.cart.length === 0) {
      user.cart.push({
        product,
        quantity: 1,
      });
    } else {
      let isProductFound = false;
      for (i = 0; i < user.cart.length; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          isProductFound = true;
        }
      }

      if (isProductFound) {
        let producttt = user.cart.find((productt) =>
          productt.product._id.equals(product._id)
        );
        producttt.quantity++;
      } else {
        user.cart.push({
          product,
          quantity: 1,
        });
      }
    }

    user = await user.save();
    res.status(200).json(user);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.removeFromCart = async (req, res, next) => {
  try {
    const { id } = req.params;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);

    for (let i = 0; i < user.cart.length; i++) {
      if (user.cart[i].product._id.equals(product._id)) {
        if (user.cart[i].quantity == 1) {
          user.cart.splice(i, 1);
        } else {
          user.cart[i].quantity -= 1;
        }
      }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};
