const express = require("express");
const router = express.Router();
const { register, login, getUser, newpost } = require("../controllers/authController");

router.get("/login", (req, res) => res.render("login"));
router.get("/register", (req, res) => res.render("register"));
router.get("/user", getUser);
router.get("/newpost", (req,res) => res.render("newpost"));
router.get("/profile", (req, res) => res.render("profile"));

router.post("/login", login);
router.post("/register", register);
router.post("/newpost", newpost);
router.post("/logout", (req, res) => {
    res.clearCookie("token");
    res.json({ success: true, redirect: "/auth/login"});
});

module.exports = router;