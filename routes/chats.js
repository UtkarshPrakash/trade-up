const express = require("express");
const router = express.Router();
const { createChat, getUserChats, getChatMessages } = require("../controllers/chatController");

router.post("/", createChat);
router.get("/:user_id", getUserChats);
router.get("messages/:chat_id", getChatMessages);

module.exports = router;