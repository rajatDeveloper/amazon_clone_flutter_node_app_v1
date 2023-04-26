// const User = require("../models/userModel.js");
const User = require("../models/userModel");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

exports.authData = (req, res, next) => {
  res.status(200).json({
    success: true,
    auth: true,
  });
};

exports.signUp = async (req, res, next) => {
  try {
    const { name, email, password } = req.body;

    const existinguser = await User.findOne({ email });
    if (existinguser) {
      return res.status(400).json({
        success: false,
        msg: "User exists with that email ! ",
      });
    }
    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      name,
      password: hashedPassword,
    });

    user = await user.save();

    res.status(200).json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.signin = async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({
      email,
    });
    if (!user) {
      return res.status(400).json({
        success: false,
        msg: "User with this email does not exists, Sign-Up First ! ",
      });
    }

    const isMatched = await bcryptjs.compare(password, user.password);

    if (!isMatched) {
      return res.status(400).json({
        success: false,
        msg: "Wrong Password  ; Retry ! ",
      });
    }

    const token = jwt.sign(
      {
        id: user._id,
      },
      "passwordKey"
    );

    res.json({
      token,
      ...user._doc,
    });
  } catch (error) {
    res.status(500).json({
      error: e.message,
    });
  }
};

exports.tokenCheck = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) {
      return res.json(false);
    }

    const verified = jwt.verify(token, "passwordKey");
    if (!verified) {
      return res.json(false);
    }

    const user = await User.findById(verified.id);

    if (!user) {
      return res.json(false);
    }

    res.json(true);
  } catch (error) {
    res.status(500).json({
      error: e.message,
    });
  }
};

///get user data
exports.getUserData = async (req, res, next) => {
  try {
    const user = await User.findById(req.user);
    res.json({
      ...user._doc,
      token: req.token,
    });
  } catch (error) {
    res.status(500).json({
      error: e.message,
    });
  }
};
