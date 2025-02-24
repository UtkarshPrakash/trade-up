const pool = require("../db/pool");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

exports.register = async (req, res) => {
    try {
        const { username, password, age } = req.body;

        // setting a default profile pic for now
        profile_pic = "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
        const hashedPassword = await bcrypt.hash(password, 10);

        const newUser = await pool.query(
            "INSERT INTO users (username, pass, age, profile_pic) VALUES ($1, $2, $3, $4) RETURNING id, username",
            [username, hashedPassword, age, profile_pic]
        );

        res.redirect("index");
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.login = async (req, res) => {
    try {
        const { username, password } = req.body;
        const user = await pool.query("SELECT * FROM users WHERE username = $1", [username]);
        
        if (user.rows.length === 0) return res.status(400).json({ error: "Invalid credentials" });
        
        const validPassword = await bcrypt.compare(password, user.rows[0].pass);
        if (!validPassword) return res.status(400).json({ error: "Invalid credentials" });
        
        const token = jwt.sign({ user_id: user.rows[0].id }, process.env.JWT_SECRET, { expiresIn: "1h" });
        // Set token in cookies
        res.cookie("token", token, { httpOnly: true });

        res.json({ success: true, redirect: "/"});
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
