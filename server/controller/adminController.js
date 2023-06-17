const { Product } = require("../models/productModel");

const { Order } = require("../models/orderModel");
exports.postProduct = async (req, res, next) => {
  try {
    const { name, price, description, category, quantity, images } = req.body;
    let product = Product({
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
      error: error.message,
    });
  }
};

exports.getProducts = async (req, res, next) => {
  try {
    const products = await Product.find({});

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
    let product = await Product.findByIdAndDelete(id);

    res.status(200).json(product);
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
};

exports.getOrders = async (req, res, next) => {
  try {
    const orders = await Order.find({});
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

exports.updateOrderStatus = async (req, res, next) => {
  try {
    const { id, status } = req.body;
    let order = await Order.findById(id);
    order.status = status;
    order = await order.save();
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

exports.getEarning = async (req, res, next) => {
  try {
    const orders = await Order.find({});
    let totalEarnings = 0;

    for (let i = 0; i < orders.length; i++) {
      for (let j = 0; j < orders[i].products.length; j++) {
        totalEarnings +=
          orders[i].products[j].quantity * orders[i].products[j].product.price;
      }
    }
    // CATEGORY WISE ORDER FETCHING
    let mobileEarnings = await fetchCategoryWiseProduct("Mobiles");
    let essentialEarnings = await fetchCategoryWiseProduct("Essentials");
    let applianceEarnings = await fetchCategoryWiseProduct("Appliances");
    let booksEarnings = await fetchCategoryWiseProduct("Books");
    let fashionEarnings = await fetchCategoryWiseProduct("Fashion");

    let earnings = {
      totalEarnings,
      mobileEarnings,
      essentialEarnings,
      applianceEarnings,
      booksEarnings,
      fashionEarnings,
    };

    res.json(earnings);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};


async function fetchCategoryWiseProduct(category) {
  let earnings = 0;
  let categoryOrders = await Order.find({
    "products.product.category": category,
  });

  for (let i = 0; i < categoryOrders.length; i++) {
    for (let j = 0; j < categoryOrders[i].products.length; j++) {
      earnings +=
        categoryOrders[i].products[j].quantity *
        categoryOrders[i].products[j].product.price;
    }
  }
  return earnings;
}
