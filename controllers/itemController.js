const pool = require("../db/pool");

exports.getItems = async (req, res) => {
    try {
        const items = await pool.query("SELECT * FROM items ORDER BY created_at DESC");
        res.json(items.rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getItem = async (req, res) => {
    try {
        const { id } = req.params;
        const item = await pool.query("SELECT * FROM items WHERE id = $1", [id]);
        if (item.rows.length === 0) return res.status(404).json({ error: "Item not found" });
        res.json(item.rows[0]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.createItem = async (req, res) => {
    try {
        const { user_id, title, description, price, image_url } = req.body;
        const newItem = await pool.query(
            "INSERT INTO items (user_id, title, description, price, image_url, created_at) VALUES ($1, $2, $3, $4, $5, NOW()) RETURNING *",
            [user_id, title, description, price, image_url]
        );
        res.json(newItem.rows[0]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.updateItem = async (req, res) => {
    try {
        const {id} = req.params;
        const {title, description, price, image_url } = req.body;

        const updatedItem = await pool.query(
            "UPDATE items SET title = $1, description = $2, price = $3, image_url = $4 WHERE id = $5 RETURNING *",
            [title, description, price, image_url, id]
        );
        if (updatedItem.rows.length === 0) return res.status(404).json({ error: "Item not found" });
        res.json(updatedItem.rows[0]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.deleteItem = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedItem = await pool.query("DELETE FROM items WHERE id = $1 RETURNING *", [id]);
        if (deletedItem.rows.length === 0) return res.status(404).json({ error: "Item not found" });
        res.json({ message: "Item deleted" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}