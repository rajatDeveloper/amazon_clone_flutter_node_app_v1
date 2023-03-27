const mongoose = require("mongoose");

const connnectDatabase = () => {
    mongoose.set('strictQuery', true);
    mongoose.connect(process.env.DB_URI, {
        // useNewUrlParser: true,
        // useUnifiedTopology: true,
        // useCreateIndex: true
    })
        .then((data) => {
            console.log(`MongoDB connected with server ${data.connection.host}`);
        })

}

module.exports = connnectDatabase; 