const express = require("express");

const dotenv = require("dotenv");
dotenv.config({ path: "config/config.env" });
const app = express();

app.use(express.json());

//all routes

const authRoute = require("./routes/authRoutes.js");
const adminRoute = require("./routes/adminRoutes.js");
const productRoute = require("./routes/productRoutes.js");
const userRoute = require("./routes/userRoutes.js");

app.use("/api/auth", authRoute);
app.use("/api/admin", adminRoute);
app.use("/api/product", productRoute);
app.use("/api/user", userRoute);
app.use((err, req, res, next) => {
  const errorStatus = err.status || 500;
  const errorMessage = err.message || "error ! max unknown ! ";

  return res.status(errorStatus).send({
    message: errorMessage,
  });
});

module.exports = app;
