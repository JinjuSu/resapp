const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const path = require("path");

const app = express();
app.use(cors());
app.use(express.json());
app.use("/images", express.static(path.join(__dirname, "images")));

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

app.get("/orders/:id", (req, res) => {
  const orderId = req.params.id;
  const query = "SELECT * FROM Orders WHERE OrderID = ?";
  db.query(query, [orderId], (err, results) => {
    if (err) {
      console.error("Error fetching order:", err);
      res.status(500).send("Error fetching order");
      return;
    }
    if (results.length === 0) {
      res.status(404).send("Order not found");
      return;
    }
    res.json(results[0]);
  });
});

// enpoints fot posting order payment in Payment.vue and order status in OrdersView.vue
app.put("/orders/:id", (req, res) => {
  const orderId = req.params.id;
  const { PaymentDetails, OrderStatus } = req.body;
  const query =
    "UPDATE Orders SET PaymentDetails = ?, OrderStatus = ? WHERE OrderID = ?";

  console.log(`Updating order ${orderId} with status ${OrderStatus}`);

  db.query(
    query,
    [JSON.stringify(PaymentDetails), OrderStatus, orderId],
    (err, results) => {
      if (err) {
        console.error("Error updating order payment details:", err);
        res.status(500).send("Error updating order payment details");
        return;
      }
      if (results.affectedRows === 0) {
        res.status(404).send("Order not found");
        return;
      }
      res.send("Order payment details updated successfully");
    }
  );
});

app.post("/reservations", (req, res) => {
  const { CustomerName, Date, Time, TableID } = req.body;
  console.log("CustomerName:", CustomerName);
  console.log("Date:", Date);
  console.log("Time:", Time);
  console.log("TableID:", TableID);

  const query =
    "INSERT INTO Reservation (CustomerName, Date, Time, TableID) VALUES (?, ?, ?, ?)";

  db.query(query, [CustomerName, Date, Time, TableID], (err, results) => {
    if (err) {
      console.error("Error creating reservation:", err);
      res.status(500).send("Error creating reservation");
      return;
    }
    res.status(201).send("Reservation created successfully");
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

// enpoints for order submission in CartView.vue
app.post("/orders", (req, res) => {
  const { Timestamp, TableID, Items, Total, PaymentDetails, OrderStatus } =
    req.body;
  console.log("Timestamp:", Timestamp);
  console.log("TableID:", TableID);
  console.log("Items:", Items);
  console.log("Total:", Total);
  console.log("PaymentDetails:", PaymentDetails);
  console.log("OrderStatus:", OrderStatus);

  const query =
    "INSERT INTO Orders (Timestamp, TableID, Items, Total, PaymentDetails, OrderStatus) VALUES (?, ?, ?, ?, ?, ?)";
  db.query(
    query,
    [
      Timestamp,
      TableID,
      JSON.stringify(Items),
      Total,
      JSON.stringify(PaymentDetails),
      OrderStatus,
    ],
    (err, results) => {
      if (err) {
        console.error("Error creating order:", err);
        res.status(500).send("Error creating order");
        return;
      }
      // Return the OrderID of the newly created order
      res.status(201).send({
        OrderID: results.insertId,
        message: "Order created successfully",
      });
    }
  );
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
