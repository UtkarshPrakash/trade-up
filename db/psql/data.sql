--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: molecule
--

INSERT INTO public.chats (id, buyer_id, seller_id, created_at) OVERRIDING SYSTEM VALUE VALUES (1, 1, 2, '2025-02-23 10:00:00');
INSERT INTO public.chats (id, buyer_id, seller_id, created_at) OVERRIDING SYSTEM VALUE VALUES (2, 2, 3, '2025-02-23 10:05:00');
INSERT INTO public.chats (id, buyer_id, seller_id, created_at) OVERRIDING SYSTEM VALUE VALUES (3, 3, 1, '2025-02-23 10:10:00');
INSERT INTO public.chats (id, buyer_id, seller_id, created_at) OVERRIDING SYSTEM VALUE VALUES (4, 8, 3, '2025-02-26 21:21:01.435129');
INSERT INTO public.chats (id, buyer_id, seller_id, created_at) OVERRIDING SYSTEM VALUE VALUES (8, 8, 9, '2025-02-27 01:14:37.37495');
INSERT INTO public.chats (id, buyer_id, seller_id, created_at) OVERRIDING SYSTEM VALUE VALUES (9, 9, 9, '2025-02-27 01:15:00.068798');


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: molecule
--

INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Vintage Lamp', 'A beautiful vintage lamp.', 650, 'https://m.media-amazon.com/images/I/71-V+DX0olL._AC_UF1000,1000_QL80_.jpg', '2025-02-23 09:30:00');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Modern Chair', 'A sleek modern chair.', 2500, 'https://thumbs.dreamstime.com/b/explore-stunning-collection-unique-modern-chair-designs-blend-functionality-artistic-flair-elevate-your-space-288578786.jpg', '2025-02-23 09:45:00');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (3, 9, 'Iphone 15', 'A beautiful and performant phone, very lightly used.', 60000, 'https://images.macrumors.com/t/TkNh1oQ0-9TnnBjDnLyuz6yLkjE=/1600x0/article-new/2023/09/iPhone-15-General-Feature-Black.jpg', '2025-02-23 10:15:00');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (7, 10, 'Canyon Mountain Bike', 'A bike with highly modern design.', 19000, 'https://road.cc/sites/default/files/styles/main_width/public/canyon-orbiter.jpeg', '2025-02-23 10:15:00');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (8, 11, 'Trolley bag', 'A high capacity trolley bag.', 3000, 'https://www.shutterstock.com/image-photo/luggage-black-suitcase-isolated-on-600nw-2489321493.jpg', '2025-02-23 10:15:00');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (9, 8, 'Induction Stove', 'A lightly used induction stove with 5 star rating', 1200, 'https://glenindia.com/cdn/shop/products/1_86730cd7-ee2b-43a4-b928-2befdfc4e64c_700x700.jpg?v=1664182290', '2025-03-01 02:32:21.094065');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (10, 10, 'Tea Kettle', 'A beautiful whistling tea kettle for your mornings!', 3500, 'https://m.media-amazon.com/images/I/711Y0jR4S0L.jpg', '2025-03-01 02:36:36.371833');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (11, 11, 'Coffee Machine', 'Another solution for your mornings!', 14000, 'https://corporatecoffee.ae/wp-content/uploads/2023/07/Franke-A400-bean-to-cup-coffee-machine-with-fresh-milk.jpg', '2025-03-01 03:12:52.678988');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (12, 11, 'RedTape Sneakers', 'A compulsory addition to your outfit!', 1100, 'https://assets.ajio.com/medias/sys_master/root/20240926/JKei/66f511bdf9b8ef490b6ad6f3/-473Wx593H-466324904-black-MODEL.jpg', '2025-03-01 03:14:34.547225');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (13, 11, 'Portable Vacuum Cleaner', 'Extremely portable cleaner for your car', 4999, 'https://www.robustt.in/cdn/shop/files/9_b17be29a-d7d2-4ee1-ade3-9923e91005e7.jpg?v=1737368476', '2025-03-01 03:15:53.288574');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (14, 9, 'Oranger Mechanical Keyboard', 'Beautiful and high performant mechanical keyboard', 8000, 'https://i.extremetech.com/imagery/content-types/00hygCJbhhvWfYz79pKTe4x/hero-image.fit_lim.v1678673392.jpg', '2025-03-01 03:18:27.376678');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (16, 9, 'RTX 2080 Super', 'Not so vintage graphics card', 20000, 'https://sm.ign.com/t/ign_in/review/n/nvidia-gef/nvidia-geforce-rtx-2080-super-review_vqry.1200.jpg', '2025-03-01 03:21:04.50419');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (17, 9, 'Garmin Smartwatch', 'Pleasant round face smartwatch', 2300, 'https://www.jbhifi.com.au/cdn/shop/products/665845-Product-0-I-638307611405584735_grande.jpg', '2025-03-01 03:22:43.000871');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (18, 9, 'Noctua fan', 'Not so used fan for your battlestation', 1800, 'https://noctua.at/pub/media/wysiwyg/news/nf_a4x10_24v_pwm_launch_web.jpg', '2025-03-01 03:24:30.226202');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (19, 8, 'Archies French Aroma', 'Smell something classy!', 300, 'https://www.thearchies.in/cdn/shop/files/image_2024-10-15_121533795.png?v=1728974739', '2025-03-01 03:32:22.145507');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (20, 8, 'Ruffle Short Dress', 'V Neck Short Sleeve Dress', 600, 'https://littleboxindia.com/cdn/shop/files/Ruffle_Wrap_V_Neck_Short_Sleeve_Tie_Knot_Short_Dress_In_Maroon_900x.jpg?v=1740476294', '2025-03-01 03:36:46.054806');
INSERT INTO public.items (id, user_id, title, description, price, image_url, created_at) OVERRIDING SYSTEM VALUE VALUES (21, 8, 'Geocartel Handbag', 'Modern bag for modern you!', 1500, 'https://5.imimg.com/data5/SELLER/Default/2022/5/UZ/VS/OX/76808230/geocarter-handbag-fashion-satchel-purse-top-handle-tote-for-women.jpg', '2025-03-01 03:37:57.122759');


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: molecule
--

INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 'Hi! Im interested.', '2025-02-23 10:01:00');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (2, 1, 2, 'Sure! What would you like to know?', '2025-02-23 10:02:00');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (3, 2, 2, 'Hello! Is the item still available?', '2025-02-23 10:06:00');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (4, 8, 8, 'Hi senti', '2025-02-27 01:19:17.279053');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (5, 8, 9, 'Hi spyshu', '2025-02-27 01:20:02.452179');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (6, 8, 8, 'Senti?', '2025-02-27 23:17:06.309705');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (7, 8, 9, 'Spyshu?', '2025-02-27 23:17:21.5362');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (8, 8, 8, 'woooo aapka chat system kaam kar rha hai ≡ƒÑ│≡ƒÑ│≡ƒÑ│', '2025-02-27 23:17:50.819558');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (9, 8, 9, 'haa ≡ƒÑ░≡ƒÿÿ', '2025-02-27 23:18:13.698465');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (10, 8, 9, 'but ye abhi real time update nahi ho rha on screen.. also isko message sender name bhi dikhana chahiye', '2025-02-27 23:18:47.262792');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (11, 8, 8, 'haa.. jaldi se thik kar lo', '2025-02-27 23:19:02.227178');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (12, 8, 9, 'haa thik hai', '2025-02-27 23:19:09.328933');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (13, 8, 8, 'abhi?', '2025-02-27 23:29:09.451413');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (14, 8, 9, 'nhi spice, abhi bhi nahi auto refresh ho rha', '2025-02-27 23:29:42.884324');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (15, 8, 8, 'hello', '2025-02-27 23:32:04.075276');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (16, 8, 9, 'haa', '2025-02-27 23:33:08.627359');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (17, 8, 8, 'huiiiii', '2025-02-27 23:38:00.185523');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (18, 8, 9, 'pagal ≡ƒÿà', '2025-02-27 23:38:22.787773');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (19, 8, 8, 'abb?', '2025-02-28 00:30:09.122605');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (20, 8, 8, 'zara sa jhoom lu mai?', '2025-02-28 00:30:48.010518');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (21, 8, 9, 'arre na re na re na', '2025-02-28 00:32:28.661954');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (22, 8, 8, 'zara sa ghoom lu mai?', '2025-02-28 00:34:24.173574');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (23, 8, 9, 'arre na re na re na', '2025-02-28 00:35:48.447034');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (24, 8, 8, 'aa tujhe choom lu mai', '2025-02-28 00:36:10.890602');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (25, 8, 9, 'haaaa ≡ƒÑ░≡ƒÑ░≡ƒÑ░', '2025-02-28 00:37:30.49508');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (26, 8, 8, 'pagal senti ≡ƒÆò', '2025-02-28 00:37:57.919892');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (27, 8, 8, 'I love you senti', '2025-02-28 00:38:23.448699');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (28, 8, 9, 'I love you too spice', '2025-02-28 00:38:42.238275');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (29, 8, 9, 'Hi spice', '2025-02-28 00:39:22.297335');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (30, 8, 8, 'Hiii sentiiiiiiiiiiii', '2025-02-28 00:39:34.967425');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (31, 8, 9, 'Kitni excited ≡ƒñ¡', '2025-02-28 00:50:04.165518');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (32, 8, 9, 'cutie kahi ki', '2025-02-28 00:50:23.60009');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (33, 8, 8, 'heeeee aap bhi', '2025-02-28 00:53:05.240018');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (34, 8, 9, 'pgl', '2025-02-28 00:53:34.219102');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (35, 8, 8, '*pgl ki girlfriend', '2025-02-28 00:53:52.301865');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (36, 8, 8, 'Ab ye thoda better dikh raha hai senti', '2025-02-28 02:24:40.641671');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (37, 8, 9, 'hai na', '2025-02-28 02:26:41.954682');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (38, 8, 8, 'haa', '2025-02-28 02:26:46.794405');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (39, 8, 8, 'sahi hai', '2025-02-28 02:26:57.860993');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (40, 8, 9, 'thanks spice', '2025-02-28 02:27:03.019485');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (41, 7, 8, 'Hello, is this item available?', '2025-03-01 00:42:38.753747');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (42, 8, 8, 'Hi senti', '2025-03-01 00:42:59.4728');
INSERT INTO public.messages (id, chat_id, sender_id, message, "timestamp") OVERRIDING SYSTEM VALUE VALUES (43, 8, 9, 'Hi babe', '2025-03-01 00:44:07.103627');


--
-- Data for Name: saved_items; Type: TABLE DATA; Schema: public; Owner: molecule
--

INSERT INTO public.saved_items (user_id, item_id) VALUES (1, 1);
INSERT INTO public.saved_items (user_id, item_id) VALUES (2, 2);
INSERT INTO public.saved_items (user_id, item_id) VALUES (3, 3);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: molecule
--

INSERT INTO public.users (id, username, pass, age, profile_pic) OVERRIDING SYSTEM VALUE VALUES (1, 'Rohan', 'pass123', 25, 'https://i.sstatic.net/l60Hf.png');
INSERT INTO public.users (id, username, pass, age, profile_pic) OVERRIDING SYSTEM VALUE VALUES (3, 'Pikachu', 'pass789', 22, 'https://i.sstatic.net/l60Hf.png');
INSERT INTO public.users (id, username, pass, age, profile_pic) OVERRIDING SYSTEM VALUE VALUES (2, 'Kailash', 'pass456', 30, 'https://i.sstatic.net/l60Hf.png');
INSERT INTO public.users (id, username, pass, age, profile_pic) OVERRIDING SYSTEM VALUE VALUES (10, 'Rico', '$2b$10$0S5gB3R.DKZmEwtkG9dhXe8gJx.wTUTkNxVAHZS4dM3pAkJ4JQxLe', 42, 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg');
INSERT INTO public.users (id, username, pass, age, profile_pic) OVERRIDING SYSTEM VALUE VALUES (11, 'Arjun', '$2b$10$c5VD.tz5dwumu68h/qjBy.1REy8IWsxWlxkL1WFoX3oNjsKoMN2dm', 34, 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg');
INSERT INTO public.users (id, username, pass, age, profile_pic) OVERRIDING SYSTEM VALUE VALUES (8, 'Spicy', '$2b$10$m/lmvwKn194D84FJ0VhNM.4M7jKJWqEKHMHVUoGi1G0HDm9NwqsIO', 23, 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg');
INSERT INTO public.users (id, username, pass, age, profile_pic) OVERRIDING SYSTEM VALUE VALUES (9, 'Senti', '$2b$10$iqtKsx2uGYQyL5GcPxQ8A.fj3XzGl7981zLwUolNzQqhfdpHASADS', 24, 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg');


--
-- Name: chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: molecule
--

SELECT pg_catalog.setval('public.chats_id_seq', 11, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: molecule
--

SELECT pg_catalog.setval('public.items_id_seq', 21, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: molecule
--

SELECT pg_catalog.setval('public.messages_id_seq', 43, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: molecule
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- PostgreSQL database dump complete
--

