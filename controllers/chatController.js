const pool = require("../db/pool");
require("dotenv").config();

const PORT = process.env.PORT || 3000;

exports.createChat = async (req, res) => {
    try {
        const { buyer_id, seller_id } = req.body;

        // Check if the chat already exists
        const chat = await pool.query(
            "SELECT * FROM chats WHERE (buyer_id = $1 AND seller_id = $2) OR (seller_id = $1 AND buyer_id = $2)",
            [buyer_id, seller_id]
        );

        let chat_id;
        if (chat.rows.length > 0) {
            chat_id = chat.rows[0].id;
        } else {
            const chat = await pool.query(
                "INSERT INTO chats (buyer_id, seller_id, created_at) VALUES ($1, $2, NOW()) RETURNING *",
                [buyer_id, seller_id]
            );
            chat_id = chat.rows[0].id;
        }
        // res.redirect(`/chats/messages/${chat_id}`); // redirection caused the issue where res is undefined
        res.json({ chat_id });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getUserChats = async (req, res) => {
    try {
        const token = req.cookies?.token || req.headers.authorization?.split(" ")[1];
        if (!token) return res.redirect("/auth/login");

        // Fetch user data
        const response = await fetch(`http://localhost:${PORT}/auth/user`, {
            method: "GET",
            headers: { Cookie: `token=${token}` }
        });

        if (!response.ok) throw new Error("Failed to fetch user data");

        const userData = await response.json();
        const user_id = userData.id;

        // Fetch all user chats (for the sidebar)
        const chats = await pool.query(
            " select a.*, b.username as buyer_name, c.username as seller_name from chats a join users b on a.buyer_id=b.id join users c on a.seller_id=c.id WHERE buyer_id = $1 OR seller_id = $1 ORDER BY created_at DESC",
            [user_id]
        );

        // Render the chats page without selecting any specific messages
        res.render("chats", {
            chats: chats.rows,
            user_id,
            messages: [], // No messages loaded initially
            chat_id: null,
            chatDetails: [],
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server error");
    }
};


exports.getChatMessages = async (req, res) => {
    try {
        const chatId = req.params.chatId;
        const token = req.cookies?.token || req.headers.authorization?.split(" ")[1];
        if (!token) return res.redirect("/auth/login");

        // Fetch user data
        const response = await fetch(`http://localhost:${PORT}/auth/user`, {
            method: "GET",
            headers: { Cookie: `token=${token}` }
        });

        if (!response.ok) throw new Error("Failed to fetch user data");

        const userData = await response.json();
        const user_id = userData.id;

        // Fetch all user chats (for the sidebar)
        const chats = await pool.query(
            " select a.*, b.username as buyer_name, c.username as seller_name from chats a join users b on a.buyer_id=b.id join users c on a.seller_id=c.id WHERE buyer_id = $1 OR seller_id = $1 ORDER BY created_at DESC",
            [user_id]
        );

        // Fetch selected chat messages
        const messages = await pool.query(
            "SELECT * FROM messages WHERE chat_id = $1 ORDER BY timestamp ASC",
            [chatId]
        );

        // Fetch chat details
        const chatDetails = await pool.query(
            " select a.*, b.username as buyer_name, c.username as seller_name from chats a join users b on a.buyer_id=b.id join users c on a.seller_id=c.id WHERE a.id = $1", 
            [chatId]
        );

        if (chatDetails.rows.length === 0) return res.status(404).send("Chat not found");

        res.render("chats", {
            chats: chats.rows,  // Sidebar chats
            user_id,
            messages: messages.rows,  // Messages for the selected chat
            chat_id: chatId,
            chatDetails: chatDetails.rows[0],
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server error");
    }
};
