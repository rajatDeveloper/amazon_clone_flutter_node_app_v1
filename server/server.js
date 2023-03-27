const app = require("./app");
const dotenv = require("dotenv");

const connnectDatabase = require("./config/database");

//config -- need to be on top
dotenv.config({ path: "config/config.env" });

//connecting data
connnectDatabase();

const server = app.listen(process.env.PORT, "0.0.0.0", () => {
  console.log(`server is working on http://localhost:${process.env.PORT}`);
});

// 3:3
