const pool = require("../db/pool");

exports.saveItem = async (req, res) => {
    try {
        const { user_id, item_id } = req.body;
        await pool.query("INSERT INTO saved_items (user_id, item_id) VALUES ($1, $2)", [user_id, item_id]);
        res.json({ message: "Item saved" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

// user_id returned is the seller id rather the user for which we are checking the saved post
exports.getSavedItems = async (req, res) => {
    try {
        const { user_id } = req.params;
        console.log(user_id);
        const savedItems = await pool.query(
            "SELECT b.* FROM saved_items a JOIN items b ON a.item_id = b.id WHERE a.user_id = $1",
            [user_id]
        );
        res.json(savedItems.rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.removeSavedItem = async (req, res) => {
    try {
        const { user_id, item_id } = req.body;
        await pool.query("DELETE FROM saved_items WHERE user_id = $1 AND item_id = $2", [user_id, item_id]);
        res.json({ message: "Item removed saved list" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};