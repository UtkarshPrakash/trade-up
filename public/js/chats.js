const socket = io();
let currentChatId = parseInt(window.location.pathname.split("/").pop(), 10);

document.addEventListener("DOMContentLoaded", () => {
    const messagesBox = document.getElementById("messages");

    socket.emit("join_chat", currentChatId);

    window.sendMessage = function () {
        const input = document.getElementById("messageInput");
        const message = input.value.trim();
        if (!message) return;

        const senderId = window.userId; 
        console.log(`senderId: ${senderId}`);

        socket.emit("send_message", { chat_id: currentChatId, sender_id: senderId, message });
        input.value = "";
    };

    // Receive message and update UI instantly
    socket.on("receive_message", (message) => {
        if (message.chat_id === currentChatId) {
            const messageDiv = document.createElement("div");
            messageDiv.textContent = message.message;
            messageDiv.classList.add(message.sender_id === window.userId ? "sent" : "received");
            messagesBox.appendChild(messageDiv);
            messagesBox.scrollTop = messagesBox.scrollHeight; // This auto-scrolls to latest message
        }
    });
});

// To scroll down at the latest message every time
function scrollToBottom() {
    const messagesDiv = document.getElementById("messages");
    if (messagesDiv) {
        setTimeout(() => {
            messagesDiv.scrollTop = messagesDiv.scrollHeight;
        }, 100); // Small delay to ensure messages are fully loaded
    }
}

window.onload = scrollToBottom