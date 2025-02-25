const socket = io();
let currentChatId = null;

document.addEventListener("DOMContentLoaded", async () => {
    const chatList = document.getElementById("chatList");
    const messagesBox = document.getElementById("messages");
    const chatTitle = document.getElementById("chatTitle");
    const inputBox = document.getElementById("inputBox");

    // Fetch user chats
    const response = await fetch("/chats");
    const chats = await response.json();

    chats.forEach(chat => {
        const chatItem = document.createElement("div");
        chatItem.classList.add("chat-item");
        chatItem.textContent = `Chat with ${chat.seller_id}`; // You might want to fetch usernames instead of IDs
        chatItem.onclick = () => loadChat(chat.id);
        chatList.appendChild(chatItem);
    });

    // Function to load messages of a chat
    async function loadChat(chatId) {
        currentChatId = chatId;
        chatTitle.textContent = `Chat #${chatId}`;
        inputBox.style.display = "flex";
        messagesBox.innerHTML = "";

        const response = await fetch(`/chats/${chatId}`);
        const messages = await response.json();

        messages.forEach(msg => {
            const messageDiv = document.createElement("div");
            messageDiv.textContent = msg.message;
            messagesBox.appendChild(messageDiv);
        });

        socket.emit("join_chat", chatId);
    }

    // Send message
    window.sendMessage = function () {
        const input = document.getElementById("messageInput");
        const message = input.value.trim();
        if (!message || !currentChatId) return;

        socket.emit("send_message", { chat_id: currentChatId, sender_id: 1, message }); // Replace sender_id dynamically
        input.value = "";
    };

    // Receive message
    socket.on("receive_message", (message) => {
        if (message.chat_id === currentChatId) {
            const messageDiv = document.createElement("div");
            messageDiv.textContent = message.message;
            messagesBox.appendChild(messageDiv);
        }
    });
});
