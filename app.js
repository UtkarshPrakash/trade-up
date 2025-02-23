require("dotenv").config();
const express = require("express");
const authRoutes = require("./routes/auth");
const itemRoutes = require("./routes/items");
const savedItemRoutes = require("./routes/savedItems");
const app = express();

app.use(express.json());
app.set("view engine", "ejs");

app.use("/auth", authRoutes);
app.use("/items", itemRoutes);
app.use("/savedItems", savedItemRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running: ${PORT}`);
});