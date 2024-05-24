const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "RestaurantApp",
});

db.connect((err) => {
  if (err) {
    console.error("Error connecting to the database:", err);
    return;
  }
  console.log("Connected to the MySQL database.");
});

app.get("/orders", (req, res) => {
  const query = "SELECT * FROM orders";
  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching orders:", err);
      res.status(500).send("Error fetching orders");
      return;
    }
    res.json(results);
  });
});

app.put("/orders/:id", (req, res) => {
  const orderId = req.params.id;
  const { OrderStatus } = req.body;
  const query = "UPDATE orders SET OrderStatus = ? WHERE OrderID = ?";

  console.log(`Updating order ${orderId} with status ${OrderStatus}`);

  db.query(query, [OrderStatus, orderId], (err, results) => {
    if (err) {
      console.error("Error updating order status:", err);
      res.status(500).send("Error updating order status");
      return;
    }
    if (results.affectedRows === 0) {
      res.status(404).send("Order not found");
      return;
    }
    res.send("Order status updated successfully");
  });
});

// New endpoint to fetch the menu items
app.get("/menu", (req, res) => {
  const query = "SELECT * FROM menu";
  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching menu:", err);
      res.status(500).send("Error fetching menu");
      return;
    }
    res.json(results);
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
