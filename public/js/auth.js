async function startChat(buyerId, sellerId) {
    try {
        const response = await fetch("/chats/new", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ buyer_id: buyerId, seller_id: sellerId }),
        });

        if (!response.ok) throw new Error("Failed to start chat");

        const chatData = await response.json();
        window.location.href = `/chats/${chatData.chat_id}`; // Redirects to chat page
    } catch (err) {
        console.error("Error starting chat:", err);
    }
}

document.addEventListener("DOMContentLoaded", () => {
    const loginForm = document.getElementById("login-form");
    const signupForm = document.getElementById("signup-form");

    async function handleAuth(event, endpoint) {
        event.preventDefault();
        const formData = new FormData(event.target);
        const data = Object.fromEntries(formData.entries());

        const res = await fetch(`/auth/${endpoint}`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data),
        });

        const result = await res.json();
        if (res.ok) {
            localStorage.setItem("token", result.token);
            window.location.href = "/";  // Redirect to homepage
        } else {
            alert(result.error);
        }
    }

    if (loginForm) loginForm.addEventListener("submit", (e) => handleAuth(e, "login"));
    if (signupForm) signupForm.addEventListener("submit", (e) => handleAuth(e, "register"));
});

document.getElementById("logout-form").addEventListener("submit", async (e) => {
    e.preventDefault();
    
    const response = await fetch("/auth/logout", {
        method: "POST",
    });

    const data = await response.json();
    if (data.success) {
        window.location.href = data.redirect; // Redirect to login page
    }
});