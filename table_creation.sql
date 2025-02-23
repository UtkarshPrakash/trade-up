CREATE DATABASE tradeup;
\c tradeup;

CREATE TABLE users (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    username VARCHAR ( 255 ),
    pass VARCHAR ( 255 ),
    age INTEGER,
    profile_pic TEXT
);

CREATE TABLE items (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id INTEGER NOT NULL,
    title VARCHAR ( 255 ) NOT NULL,
    description TEXT,
    price INTEGER,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE saved_items (
    user_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL
);

CREATE TABLE chats (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    buyer_id INTEGER NOT NULL,
    seller_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE messages (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    chat_id INT NOT NULL,
    sender_id INT NOT NULL,
    message TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

---------------------------------------------------------
INSERT INTO users (username, pass, age, profile_pic) VALUES
('user1', 'pass123', 25, 'http://example.com/user1.jpg'),
('user2', 'pass456', 30, 'http://example.com/user2.jpg'),
('user3', 'pass789', 22, 'http://example.com/user3.jpg');


INSERT INTO items (user_id, title, description, price, image_url, created_at) VALUES
(1, 'Vintage Lamp', 'A beautiful vintage lamp.', 45, 'http://example.com/lamp.jpg', '2025-02-23 09:30:00'),
(2, 'Modern Chair', 'A sleek modern chair.', 89, 'http://example.com/chair.jpg', '2025-02-23 09:45:00'),
(3, 'Wooden Table', 'A sturdy wooden table.', 150, 'http://example.com/table.jpg', '2025-02-23 10:15:00');


INSERT INTO saved_items (user_id, item_id) VALUES
(1, 1),
(2, 2),
(3, 3);


INSERT INTO chats (buyer_id, seller_id, created_at) VALUES
(1, 2, '2025-02-23 10:00:00'),
(2, 3, '2025-02-23 10:05:00'),
(3, 1, '2025-02-23 10:10:00');


INSERT INTO messages (chat_id, sender_id, message, timestamp) VALUES
(1, 1, 'Hi! Im interested.', '2025-02-23T10:01:00'),
(1, 2, 'Sure! What would you like to know?', '2025-02-23T10:02:00'),
(2, 2,'Hello! Is the item still available?', '2025-02-23T10:06:00');


