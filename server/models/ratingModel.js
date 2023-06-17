const mongoose = require("mongoose");
const {Schema} = require("mongoose");

const ratingSchema =new  Schema({
  userId: {
    type: String,
    required: true,
  },
  rating: {
    type: Number,
    required: true,
  },
});

module.exports = ratingSchema ; 

