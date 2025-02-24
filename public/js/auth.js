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