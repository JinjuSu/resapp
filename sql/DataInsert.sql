-- Inserting menu items
INSERT INTO Menu (ItemName, Category, Description, Price) VALUES
('Mignon Steak', 'Main Course', 'Cooked to your liking, served with garlic mashed potatoes, grilled asparagus, and red wine reduction sauce.', 32.99),
('Pesto Pasta', 'Main Course', 'Linguine pasta tossed in homemade basil pesto sauce with cherry tomatoes, pine nuts, and grated Parmesan cheese.', 18.99),
('Chicken Alfredo', 'Main Course', 'Tender grilled chicken breast served over fettuccine pasta in creamy Alfredo sauce, garnished with fresh parsley and Parmesan cheese.', 20.99),
('Vegetable Stir-Fry', 'Main Course', 'A colorful medley of fresh vegetables stir-fried in a savory soy ginger sauce, served over steamed rice.', 16.99),
('BBQ Ribs', 'Main Course', 'Tender baby back ribs slow-cooked and basted with tangy BBQ sauce, served with coleslaw and seasoned fries.', 25.99),
('Eggplant Parmesan', 'Main Course', 'Slices of breaded eggplant baked with marinara sauce and melted mozzarella cheese, served with spaghetti marinara.', 19.99),
('Shrimp Scampi', 'Main Course', 'Succulent shrimp sautéed in garlic butter and white wine sauce, served over linguine pasta with a sprinkle of parsley.', 22.99),
('Beef Burger', 'Main Course', 'Juicy beef patty topped with cheddar cheese, crispy bacon, lettuce, tomato, onion, and pickles, served with seasoned fries.', 15.99),
('Vegetarian Pizza', 'Main Course', 'Thin crust pizza topped with marinara sauce, mozzarella cheese, roasted vegetables, and fresh basil.', 17.99),
('Garlic Mashed Potatoes', 'Sides', 'Creamy mashed potatoes whipped with roasted garlic and butter.', 4.99),
('Steamed Broccoli', 'Sides', 'Fresh broccoli florets lightly steamed and seasoned with sea salt and black pepper.', 3.99),
('Crispy Onion Rings', 'Sides', 'Golden fried onion rings served with a side of chipotle mayo.', 5.99),
('Macaroni and Cheese', 'Sides', 'Elbow macaroni tossed in creamy cheese sauce, baked until bubbly.', 6.99),
('Roasted Brussels Sprouts', 'Sides', 'Brussels sprouts roasted with olive oil, garlic, and balsamic glaze.', 4.99),
('Sweet Potato Fries', 'Sides', 'Crispy sweet potato fries seasoned with a blend of spices.', 5.99),
('Caesar Salad', 'Sides', 'Crisp romaine lettuce tossed in creamy Caesar dressing with croutons and Parmesan cheese.', 7.99),
('Garlic Bread', 'Sides', 'Slices of toasted baguette brushed with garlic butter and herbs.', 3.99),
('Grilled Asparagus', 'Sides', 'Fresh asparagus spears grilled to perfection and drizzled with balsamic reduction.', 6.99),
('Quinoa Pilaf', 'Sides', 'Nutty quinoa cooked with vegetable broth and mixed with diced vegetables.', 5.99),
('New York Cheesecake', 'Desserts', 'Creamy cheesecake on a graham cracker crust, served plain or with your choice of strawberry or chocolate sauce.', 8.99),
('Molten Chocolate Lava Cake', 'Desserts', 'Decadent chocolate cake with a gooey molten center, served warm with vanilla ice cream.', 9.99),
('Tiramisu', 'Desserts', 'Layers of espresso-soaked ladyfingers and mascarpone cheese, dusted with cocoa powder.', 7.99),
('Key Lime Pie', 'Desserts', 'Tangy key lime filling in a buttery graham cracker crust, topped with whipped cream.', 7.99),
('Apple Crisp', 'Desserts', 'Warm apple slices baked with cinnamon and brown sugar, topped with crispy oat crumble and vanilla ice cream.', 8.99),
('Chocolate Fondue', 'Desserts', 'Rich melted chocolate served with an assortment of fresh fruit and marshmallows for dipping.', 12.99),
('Creme Brulee', 'Desserts', 'Creamy vanilla custard topped with a caramelized sugar crust.', 8.99),
('Strawberry Shortcake', 'Desserts', 'Layers of fluffy sponge cake with fresh strawberries and whipped cream.', 7.99),
('Banana Split', 'Desserts', 'A classic dessert featuring vanilla, chocolate, and strawberry ice cream topped with sliced bananas, chocolate sauce, whipped cream, and nuts.', 10.99);
('Lemon Sorbet', 'Desserts', 'Refreshing lemon sorbet served in a frozen lemon shell.', 6.99);

-- Inserting sample data into the Tables table (Max 150 customers)
INSERT INTO Tables (Capacity) VALUES
(2),    -- 2-person table
(2),    -- 2-person table
(2),    -- 2-person table
(2),    -- 2-person table
(2),    -- 2-person table
(2),    -- 2-person table
(2),    -- 2-person table
(2),    -- 2-person table
(2),    -- 2-person table
(2),    -- 2-person table
(2),    -- 2-person table
(4),    -- 4-person table
(4),    -- 4-person table
(4),    -- 4-person table
(4),    -- 4-person table
(4),    -- 4-person table
(4),    -- 4-person table
(4),    -- 4-person table
(4),    -- 4-person table
(4),    -- 4-person table
(4),    -- 4-person table
(6),    -- 6-person table
(6),    -- 6-person table
(6),    -- 6-person table
(6),    -- 6-person table
(6),    -- 6-person table
(6),    -- 6-person table
(6),    -- 6-person table
(8),    -- 8-person table
(8),    -- 8-person table
(10),   -- 10-person table
(10),   -- 10-person table
(10);   -- 10-person table

-- Inserting sample data into the Reservation table with some tables having multiple reservations on different dates and times
INSERT INTO Reservation (CustomerName, Date, Time, TableID) VALUES
('John Smith', '2024-05-20', '18:00:00', 1),
('Jane Doe', '2024-05-21', '19:00:00', 5),
('Michael Brown', '2024-05-22', '12:00:00', 10),
('Emily Davis', '2024-05-23', '13:00:00', 7),
('David Wilson', '2024-05-24', '18:00:00', 2),
('Sarah Johnson', '2024-05-25', '19:00:00', 6),
('James Lee', '2024-05-26', '12:00:00', 15),
('Patricia Kim', '2024-05-27', '13:00:00', 8),
('Robert Garcia', '2024-05-28', '18:00:00', 3),
('Linda Martinez', '2024-05-29', '19:00:00', 12),
('William Gonzalez', '2024-05-30', '12:00:00', 18),
('Elizabeth Moore', '2024-06-01', '13:00:00', 4),
('Thomas Anderson', '2024-06-02', '18:00:00', 9),
('Barbara Thompson', '2024-06-03', '19:00:00', 11),
('Christopher Taylor', '2024-06-04', '12:00:00', 13),
('Jessica Harris', '2024-06-05', '13:00:00', 14),
('Matthew Clark', '2024-06-06', '18:00:00', 17),
('Dorothy Lewis', '2024-06-07', '19:00:00', 16),
('Anthony Walker', '2024-06-08', '12:00:00', 19),
('Betty Hall', '2024-06-09', '13:00:00', 20),
('Joshua Young', '2024-06-10', '18:00:00', 21),
('Mary King', '2024-06-11', '19:00:00', 22),
('Andrew Allen', '2024-06-12', '12:00:00', 23),
('Margaret Wright', '2024-06-13', '13:00:00', 24),
('Steven Scott', '2024-06-14', '18:00:00', 25),
('Helen Green', '2024-06-15', '19:00:00', 26),
('Edward Adams', '2024-06-16', '12:00:00', 27),
('Sandra Baker', '2024-06-17', '13:00:00', 28),
('Paul Carter', '2024-06-18', '18:00:00', 29),
('Nancy Turner', '2024-06-19', '19:00:00', 30),
('Alice Cooper', '2024-06-20', '18:00:00', 1),
('Frank Miller', '2024-06-21', '19:00:00', 5),
('Grace Hopper', '2024-06-22', '12:00:00', 10),
('Henry Ford', '2024-06-23', '13:00:00', 7),
('Isaac Newton', '2024-06-24', '18:00:00', 2),
('Jane Austen', '2024-06-25', '19:00:00', 6),
('Kevin Durant', '2024-06-26', '12:00:00', 15),
('Liam Neeson', '2024-06-27', '13:00:00', 8),
('Monica Bellucci', '2024-06-28', '18:00:00', 3),
('Noah Webster', '2024-06-29', '19:00:00', 12),
('Olivia Wilde', '2024-06-30', '12:00:00', 18);


-- Inserting sample data into the Orders table
INSERT INTO Orders (Timestamp, TableID, Items, Total, PaymentDetails, OrderStatus) VALUES
('2024-05-20 18:30:00', 1, 
    '[{"ItemID": 1, "Quantity": 2, "Price": 32.99}, {"ItemID": 10, "Quantity": 1, "Price": 4.99}]', 
    70.97, 
    '{"CardType": "Visa", "CardNumber": "************1111", "ExpiryDate": "12/25", "CardholderName": "John Doe"}', 
    'Completed'),
('2024-05-21 19:45:00', 5, 
    '[{"ItemID": 2, "Quantity": 1, "Price": 18.99}, {"ItemID": 11, "Quantity": 1, "Price": 3.99}]', 
    22.98, 
    '{"CardType": "MasterCard", "CardNumber": "************2222", "ExpiryDate": "11/24", "CardholderName": "Jane Smith"}', 
    'Completed'),
('2024-05-22 12:15:00', 10, 
    '[{"ItemID": 3, "Quantity": 1, "Price": 20.99}, {"ItemID": 12, "Quantity": 1, "Price": 5.99}]', 
    26.98, 
    '{"CardType": "Amex", "CardNumber": "************3333", "ExpiryDate": "10/23", "CardholderName": "Michael Brown"}', 
    'Pending'),
('2024-05-23 13:20:00', 7, 
    '[{"ItemID": 4, "Quantity": 2, "Price": 16.99}, {"ItemID": 13, "Quantity": 1, "Price": 6.99}]', 
    40.97, 
    '{"CardType": "Discover", "CardNumber": "************4444", "ExpiryDate": "09/22", "CardholderName": "Emily Davis"}', 
    'Completed'),
('2024-05-24 18:45:00', 2, 
    '[{"ItemID": 5, "Quantity": 1, "Price": 25.99}, {"ItemID": 14, "Quantity": 2, "Price": 5.99}]', 
    37.97, 
    '{"CardType": "Visa", "CardNumber": "************5555", "ExpiryDate": "08/21", "CardholderName": "David Wilson"}', 
    'Completed'),
('2024-05-25 19:30:00', 6, 
    '[{"ItemID": 6, "Quantity": 1, "Price": 19.99}, {"ItemID": 15, "Quantity": 1, "Price": 7.99}]', 
    27.98, 
    '{"CardType": "MasterCard", "CardNumber": "************6666", "ExpiryDate": "07/25", "CardholderName": "Sarah Johnson"}', 
    'Completed'),
('2024-05-26 12:00:00', 15, 
    '[{"ItemID": 7, "Quantity": 1, "Price": 22.99}, {"ItemID": 16, "Quantity": 1, "Price": 3.99}]', 
    26.98, 
    '{"CardType": "Amex", "CardNumber": "************7777", "ExpiryDate": "06/24", "CardholderName": "James Lee"}', 
    'Completed'),
('2024-05-27 13:10:00', 8, 
    '[{"ItemID": 8, "Quantity": 1, "Price": 15.99}, {"ItemID": 17, "Quantity": 1, "Price": 6.99}]', 
    22.98, 
    '{"CardType": "Discover", "CardNumber": "************8888", "ExpiryDate": "05/23", "CardholderName": "Patricia Kim"}', 
    'Pending'),
('2024-05-28 18:20:00', 3, 
    '[{"ItemID": 9, "Quantity": 2, "Price": 17.99}, {"ItemID": 18, "Quantity": 1, "Price": 3.99}]', 
    39.97, 
    '{"CardType": "Visa", "CardNumber": "************9999", "ExpiryDate": "04/22", "CardholderName": "Robert Garcia"}', 
    'Completed'),
('2024-05-29 19:00:00', 12, 
    '[{"ItemID": 10, "Quantity": 3, "Price": 4.99}, {"ItemID": 19, "Quantity": 1, "Price": 5.99}]', 
    20.96, 
    '{"CardType": "MasterCard", "CardNumber": "************1010", "ExpiryDate": "03/21", "CardholderName": "Linda Martinez"}', 
    'Completed');