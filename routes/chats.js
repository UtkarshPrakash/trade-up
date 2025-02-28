const express = require("express");
const router = express.Router();
const { createChat, getUserChats, getChatMessages } = require("../controllers/chatController");

router.post("/new", createChat);  
router.get("/chatsPage", getUserChats); 
router.get("/:chatId", getChatMessages); // Properly renders `chats.ejs`

module.exports = router;
