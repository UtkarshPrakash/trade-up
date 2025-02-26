const socket = io();
let currentChatId = window.location.pathname.split("/").pop();

document.addEventListener("DOMContentLoaded", () => {
    const messagesBox = document.getElementById("messages");

    socket.emit("join_chat", currentChatId);

    window.sendMessage = function () {
        const input = document.getElementById("messageInput");
        const message = input.value.trim();
        if (!message) return;

        const senderId = window.userId; 

        socket.emit("send_message", { chat_id: currentChatId, sender_id: senderId, message });
        input.value = "";
    };

    // Receive message
    socket.on("receive_message", (message) => {
        if (message.chat_id === currentChatId) {
            const messageDiv = document.createElement("div");
            messageDiv.textContent = message.message;
            messageDiv.classList.add(message.sender_id === window.userId ? "sent" : "received");
            messagesBox.appendChild(messageDiv);
        }
    });
});
