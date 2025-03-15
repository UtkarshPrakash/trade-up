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
('user1', 'pass123', 25, 'https://i.sstatic.net/l60Hf.png'),
('user2', 'pass456', 30, 'https://i.sstatic.net/l60Hf.png'),
('user3', 'pass789', 22, 'https://i.sstatic.net/l60Hf.png');


INSERT INTO items (user_id, title, description, price, image_url, created_at) VALUES
(1, 'Vintage Lamp', 'A beautiful vintage lamp.', 650, 'https://m.media-amazon.com/images/I/71-V+DX0olL._AC_UF1000,1000_QL80_.jpg', '2025-02-23 09:30:00'),
(2, 'Modern Chair', 'A sleek modern chair.', 2500, 'https://thumbs.dreamstime.com/b/explore-stunning-collection-unique-modern-chair-designs-blend-functionality-artistic-flair-elevate-your-space-288578786.jpg', '2025-02-23 09:45:00'),
(3, 'Iphone 15', 'A beautiful and performant phone, very lightly used.', 60000, 'https://images.macrumors.com/t/TkNh1oQ0-9TnnBjDnLyuz6yLkjE=/1600x0/article-new/2023/09/iPhone-15-General-Feature-Black.jpg', '2025-02-23 10:15:00'),
(4, 'Canyon Mountain Bike', 'A bike with highly modern design.', 19000, 'https://road.cc/sites/default/files/styles/main_width/public/canyon-orbiter.jpeg', '2025-02-23 10:15:00'),
(5, 'Trolley bag', 'A high capacity trolley bag.', 3000, 'https://www.shutterstock.com/image-photo/luggage-black-suitcase-isolated-on-600nw-2489321493.jpg', '2025-02-23 10:15:00');


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


