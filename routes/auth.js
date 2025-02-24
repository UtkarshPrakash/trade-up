const express = require("express");
const router = express.Router();
const { register, login } = require("../controllers/authController");

router.get("/login", (req, res) => res.render("login"));
router.get("/register", (req, res) => res.render("register"));

router.post("/login", login);
router.post("/register", register);
router.post("/logout", (req, res) => {
    res.clearCookie("token");
    res.json({ success: true, redirect: "/auth/login"});
});

module.exports = router;