SET search_path TO public;

INSERT INTO users (name, email, password) VALUES
('Aisling Murphy', 'aisling.murphy@example.ie', 'pass1234'),
('Liam OConnor', 'liam.oconnor@example.ie', 'pass2345'),
('Sophie Gallagher', 'sophie.gallagher@example.ie', 'pass3456'),
('Noah Byrne', 'noah.byrne@example.ie', 'pass4567'),
('Emma Doyle', 'emma.doyle@example.ie', 'pass5678');


INSERT INTO categories (name, description) VALUES
('Tops', 'Shirts, blouses, and casual tops for all genders'),
('Bottoms', 'Jeans, trousers, skirts, and shorts'),
('Outerwear', 'Jackets, coats, and seasonal layers'),
('Footwear', 'Shoes, boots, and sandals'),
('Accessories', 'Bags, belts, hats, and small add-ons'),
('Activewear', 'Sports clothing and performance gear'),
('Formalwear', 'Suits, dresses, and occasion clothing'),
('Jewellery', 'Necklaces, bracelets, rings, and earrings'),
('Kids', 'Clothing and accessories for children'),
('Seasonal', 'Holiday items and limited-time collections');

INSERT INTO products (name, description, price, stock, category_id) VALUES
('Classic Cotton T-Shirt', 'Soft cotton t-shirt with a regular fit for everyday wear', 19.99, 45, 1),
('Oversized Graphic Tee', 'Relaxed oversized t-shirt featuring a modern graphic print', 24.99, 30, 1),
('Linen Button-Up Shirt', 'Lightweight linen shirt with a classic button-up design', 39.99, 20, 1),
('Slim Fit Jeans', 'Classic slim fit denim jeans suitable for everyday wear', 49.99, 25, 2),
('Wide Leg Trousers', 'Comfortable wide leg trousers with a tailored finish', 44.99, 18, 2),
('Denim Shorts', 'Casual mid-length denim shorts for warmer days', 29.99, 22, 2),
('Puffer Jacket', 'Warm padded jacket designed for cold weather', 89.99, 15, 3),
('Classic Denim Jacket', 'Timeless denim jacket with a relaxed fit', 59.99, 20, 3),
('Wool Blend Coat', 'Smart wool blend coat suitable for colder seasons', 119.99, 10, 3),
('White Trainers', 'Minimalist everyday trainers with a comfortable sole', 54.99, 25, 4),
('Leather Ankle Boots', 'Classic leather ankle boots with a low heel', 79.99, 12, 4),
('Canvas Slip-On Shoes', 'Lightweight canvas slip-on shoes for casual outfits', 34.99, 20, 4),
('Leather Belt', 'Classic leather belt with a polished metal buckle', 24.99, 30, 5),
('Canvas Backpack', 'Durable everyday backpack with multiple storage compartments', 39.99, 18, 5),
('Classic Baseball Cap', 'Adjustable cotton baseball cap with a simple embroidered logo', 19.99, 35, 5),
('Performance T-Shirt', 'Breathable moisture-wicking t-shirt designed for exercise', 29.99, 25, 6),
('Training Leggings', 'Stretch performance leggings designed for workouts and training', 39.99, 20, 6),
('Running Shorts', 'Lightweight running shorts with breathable fabric', 27.99, 30, 6),
('Tailored Suit Jacket', 'Smart tailored suit jacket for formal occasions', 129.99, 8, 7),
('Evening Dress', 'Elegant midi-length dress suitable for formal events', 99.99, 12, 7),
('Formal Trousers', 'Slim tailored trousers designed for formal and business wear', 59.99, 15, 7),
('Sterling Silver Necklace', 'Minimalist sterling silver necklace with a delicate pendant', 39.99, 20, 8),
('Gold Hoop Earrings', 'Classic gold-plated hoop earrings suitable for everyday wear', 24.99, 30, 8),
('Silver Charm Bracelet', 'Elegant silver bracelet with removable decorative charms', 34.99, 15, 8),
('Kids Cotton Hoodie', 'Soft cotton hoodie designed for comfortable everyday wear', 29.99, 20, 9),
('Kids Denim Jeans', 'Durable denim jeans with a comfortable adjustable waist', 34.99, 18, 9),
('Kids Trainers', 'Lightweight trainers designed for active children', 39.99, 15, 9),
('Christmas Jumper', 'Festive knitted jumper with a traditional seasonal design', 34.99, 25, 10),
('Winter Scarf', 'Warm knitted scarf designed for cold winter weather', 22.99, 30, 10),
('Summer Straw Hat', 'Lightweight straw hat perfect for sunny summer days', 27.99, 20, 10);

INSERT INTO orders (user_id, status) VALUES
(1, 'Completed'),
(1, 'Completed'),
(2, 'Pending'),
(3, 'Completed'),
(4, 'Cancelled'),
(4, 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 19.99),
(1, 4, 1, 49.99),
(1, 10, 1, 54.99),
(2, 7, 1, 89.99),
(2, 22, 1, 39.99),
(3, 2, 2, 24.99),
(3, 15, 1, 19.99),
(4, 9, 1, 119.99),
(4, 13, 1, 24.99),
(4, 23, 2, 24.99),
(5, 20, 1, 99.99),
(5, 29, 1, 22.99),
(6, 16, 1, 29.99),
(6, 17, 1, 39.99),
(6, 24, 1, 34.99);