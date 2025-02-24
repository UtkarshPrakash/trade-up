const pool = require("../db/pool");

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
        res.redirect(`/chats/messages/${chat_id}`);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getUserChats = async (req, res) => {
    try {
        const { user_id } = req.params;
        const chats = await pool.query(
            "SELECT * FROM chats WHERE (buyer_id = $1) OR (seller_id = $1) ORDER BY created_at DESC",
            [user_id]
        );
        res.json(chats.rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getChatMessages = async (req, res) => {
    try {
        const { chat_id } = req.params;
        const messages = await pool.query(
            "SELECT * FROM messages WHERE chat_id = $1 ORDER BY timestamp ASC",
            [chat_id]
        )
        res.json(messages.rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};