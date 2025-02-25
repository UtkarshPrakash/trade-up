const express = require("express");
const router = express.Router();
const { createChat, getUserChats, getChatMessages } = require("../controllers/chatController");

router.get("/", async (req, res) => {
    const userId = req.user.id; // Get user here
    const chats = await getUserChats();
    res.json("../views/chats.ejs")
});

router.get("/:chatId", async (req, res) => {
    const messages = await getChatMessages(req.params.chatId);
    res.json(messages);
});

router.post("/", createChat);
router.get("/:user_id", getUserChats);
router.get("/messages/:chat_id", getChatMessages);

module.exports = router;