// Load required libraries
require("dotenv").config();
const http = require("http");
const { Server } = require("socket.io");
const express = require("express");
const cookieParser = require("cookie-parser");
const path = require("node:path");
const pool = require("./db/pool");
const axios = require("axios");

// Handling Routes
const authRoutes = require("./routes/auth");
const itemRoutes = require("./routes/items");
const savedItemRoutes = require("./routes/savedItems");
const chatRoutes = require("./routes/chats");

const assetsPath = path.join(__dirname, "public");
const app = express();

app.use(cookieParser());
app.use(express.json());
app.use(express.static(assetsPath));
app.use(express.urlencoded({ extended: true}));
app.set("view engine", "ejs");

app.use("/auth", authRoutes);
app.use("/items", itemRoutes);
app.use("/savedItems", savedItemRoutes);
app.use("/chats", chatRoutes);

const PORT = process.env.PORT || 3000;

// Handle Login Status
app.get("/", async (req, res) => {
    const token = req.cookies?.token || req.headers.authorization?.split(" ")[1];
    if (!token) return res.redirect("/auth/login");

    try {
        const itemsResponse = await axios.get(`http://localhost:${PORT}/items`); // change to wherever hosted
        const items = itemsResponse.data || [];
        const response = await fetch(
            `http://localhost:${PORT}/auth/user`, { 
            method: "GET",
            headers: {Cookie: `token=${token}`} // /auth/user req should contain the token 
        });
        const userData = await response.json() || { id: -1 };
        // Check if user id available
        if (typeof(userData.id) === "undefined") {
            if (userData.error === "Session expired. Please log in again."){
                console.log("Session expired, redirecting to login page");
                res.redirect("/auth/login");
            } else {
                console.log(userData.error);
            }
        } else {
            res.render("index", { products: items, buyer_id: userData.id, buyer_name: userData.username });
        }
    } catch (err) {
        console.log(err.message);
        res.render("index", { products: [], buyer_id: userData.id, buyer_name: "NA" });
    }
});

// Handle profile route
app.get("/profile", (req, res) => {
    res.render("profile");
});

app.get("/chats", async (req, res) => {
    console.log("Inside /chats"); 
    const token = req.cookies?.token || req.headers.authorization?.split(" ")[1];
    if (!token) return res.redirect("/auth/login");

    try {
        const response = await fetch(`http://localhost:${PORT}/auth/user`, {
            method: "GET",
            credentials: "include", // Ensure cookies are sent
            headers: { Cookie: `token=${token}` }
        });

        if (!response.ok) throw new Error("Failed to fetch user data");

        const userData = await response.json();
        const user_id = userData.id;

        const chatResponse = await pool.query(
            "SELECT * FROM chats WHERE buyer_id = $1 OR seller_id = $1 ORDER BY created_at DESC",
            [user_id]
        );

        res.render("chats", { chats: chatResponse.rows, user_id });
    } catch (err) {
        console.error("Error:", err.message);
        res.status(500).send("Error fetching chats");
    }
});

const server = http.createServer(app);
const io = new Server(server, {
    cors: { origin: "*" }
});

// Handle Websocket for real-time chat
io.on("connection", (socket) => {
    socket.on("join_chat", (chatId) => {
        console.log(`User ${socket.id} joined chat ${chatId}`);
        socket.join(chatId);
    });

    socket.on("send_message", async ({ chat_id, sender_id, message }) => {
        try {
            console.log(`Received message: ${message} from sender ${sender_id} in chat ${chat_id}`);
            const newMessage = await pool.query(
                "INSERT INTO messages (chat_id, sender_id, message, timestamp) VALUES ($1, $2, $3, NOW()) RETURNING *",
                [chat_id, sender_id, message]
            );

            io.to(chat_id).emit("receive_message", newMessage.rows[0]);
        } catch (err) {
            console.log(err.message);
        }
    });

    socket.on("disconnect", () => {
        console.log("User disconnected:", socket.id);
    });
});

server.listen(PORT, () => {
    console.log(`Server is running on port: ${PORT}`);
});