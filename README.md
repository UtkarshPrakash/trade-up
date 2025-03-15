# TradeUp - Realtime Chat-based Marketplace

**TradeUp** is a real-time chat-based web application that allows users to post items for sale and negotiate deals via direct messaging. Inspired by platforms like OLX, it integrates chat functionality with marketplace listings, focusing on simplicity and user engagement.

---

## 🚀 Features

- ✅ **User Authentication** (Register/Login with JWT-based sessions)  
- ✅ **Post Items for Sale** with image, price, and start chat option  
- ✅ **Chat Functionality** (Start conversations, real-time messaging)  
- ✅ **Chat Sidebar** showing active conversations  
- ✅ **Responsive and Minimal UI** (basic responsive behavior)  
- ✅ **Secure JWT Handling** and protected routes  
- ✅ **PostgreSQL** for relational data storage  
- ✅ **Socket.io** for real-time chat functionality  
- ✅ **Session persistence** and error handling (like auto-redirect on expired JWT)  
- ✅ **Dynamic feed** to browse all available items  

---

## 🛠️ Tech Stack

| Technology              | Purpose                                |
|------------------------|----------------------------------------|
| **Node.js**             | Backend runtime                        |
| **Express.js**          | Web framework                          |
| **EJS**                 | Server-side rendering                  |
| **PostgreSQL**          | Relational database                    |
| **Socket.io**           | Real-time messaging                    |
| **JWT (jsonwebtoken)**  | Authentication and session management  |
| **Render**              | Deployment platform                    |
| **CSS (Custom)**        | Styling (basic responsiveness)         |

---

## 📸 Screenshots

> ![image](https://github.com/user-attachments/assets/210ee090-d170-487e-9f2b-b74680e87842)
> ![image](https://github.com/user-attachments/assets/15e94bf6-2733-4f12-9a45-07833521d356)
> ![image](https://github.com/user-attachments/assets/6ec02a40-5cb1-4593-947d-aa0c6118e42e)



---

## 🧑‍💻 How to Use

1. **Register/Login** to create an account.  
2. **Post a new item** for sale via your profile.  
3. **Browse** other users' listings on the feed.  
4. **Start a chat** with sellers/buyers to negotiate.  
5. **View ongoing chats** in the sidebar (on the chats screen) and chat in real-time.  

---

## ⚙️ Setup Locally

### Prerequisites:
- Node.js and npm
- PostgreSQL installed and running

### 1. Clone the repo

```bash
npm install
```

### 2. Install dependencies

```bash
git clone https://github.com/yourusername/tradeup.git
```
### 3. Setup PostgreSQL Database
- Create a new PostgreSQL database.
- Run schema setup (create users, items, chats, messages tables).
- Update .env

```ini
DB_USER="dbuser"
DB_HOST="dbhost"
DB_NAME="dbname"
DB_PASS="dbpass"
DB_PORT=5432
JWT_SECRET="yousecret"
NODE_ENV="development"
PORT=3000
```
### 4. Run the app

```bash
node app
```
Go to `http://localhost:3000` in your browser.

---
## 🌐 Deployment
- App is deployed on Render.
- Environment variables are managed via Render Dashboard.
- SSL/TLS handled automatically in production with PostgreSQL and backend setup.

---
## 🔒 Security
- JWT authentication to secure user sessions.
- Input validation to prevent SQL injections and malformed data.
- Secure WebSocket connection for real-time chats.

---
## ✅ Future Improvements
- ⚙️ Option to edit posts
- 📱 Mobile responsive design.
- 📸 Add image upload for items.
- 🔔 Real-time notifications for new messages and chat requests.
- ❤️ Wishlist/Save Items.
- 🔍 Search and filter functionality.
- ✨ Improve chat UX with typing indicators and message status.

---
## 💡 Learning Takeaways
- End-to-end authentication system with JWT & cookies.
- Real-time WebSocket communication with Socket.io.
- Handling production-specific configurations like SSL for PostgreSQL.
- Database schema design for marketplace and chat apps.
- Frontend and backend integration using EJS and REST API.

---
## 🔗 Live Demo
[TradeUp](https://tradeup-242k.onrender.com/)
