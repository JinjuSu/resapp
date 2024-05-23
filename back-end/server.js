const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'restaurant'
});

db.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the MySQL database.');
});

app.get('/orders', (req, res) => {
    const query = 'SELECT * FROM orders';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error fetching orders:', err);
            res.status(500).send('Error fetching orders');
            return;
        }
        res.json(results);
    });
});

app.put('/orders/:id', (req, res) => {
    const orderId = req.params.id;
    const { OrderStatus } = req.body;
    const query = 'UPDATE orders SET OrderStatus = ? WHERE OrderID = ?';

    console.log(`Updating order ${orderId} with status ${OrderStatus}`);

    db.query(query, [OrderStatus, orderId], (err, results) => {
        if (err) {
            console.error('Error updating order status:', err);
            res.status(500).send('Error updating order status');
            return;
        }
        if (results.affectedRows === 0) {
            res.status(404).send('Order not found');
            return;
        }
        res.send('Order status updated successfully');
    });
});


//reservations
app.post('/reservations', (req, res) => {
    const { CustomerName, Date, Time, TableID } = req.body;
    console.log('CustomerName:', CustomerName);
    console.log('Date:', Date);
    console.log('Time:', Time);
    console.log('TableID:', TableID);

    const query = 'INSERT INTO Reservation (CustomerName, Date, Time, TableID) VALUES (?, ?, ?, ?)';

    db.query(query, [CustomerName, Date, Time, TableID], (err, results) => {
        if (err) {
            console.error('Error creating reservation:', err);
            res.status(500).send('Error creating reservation');
            return;
        }
        res.status(201).send('Reservation created successfully');
    });

});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});