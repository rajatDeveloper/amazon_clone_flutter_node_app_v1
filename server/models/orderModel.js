const mongoose = require("mongoose");
const { productSchema } = require("./productModel");
const {Schema} = require("mongoose");
const orderSchema = new Schema({
  products: [
    {
      // product: productSchema,
      quantity: {
        type: Number,
        required: true,
      },
    },
  ],
  totalPrice: {
    type: Number,
    required: true,
  },
  address: {
    type: String,
    required: true,
  },
  userId: {
    required: true,
    type: String,
  },
  orderedAt: {
    type: Number,
    required: true,
  },
  status: {
    type: Number,
    default: 0,
  },
});


module.exports = mongoose.model("Order", orderSchema)

