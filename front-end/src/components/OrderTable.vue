<template>
    <div class="container-fluid">
        <div class="row text-center mt-4">
            <div class="col">
                <h2><strong>Hello, Kitchen Staff</strong></h2>
            </div>
        </div>

        <div class="container mt-2 p-2 tablecontainer">
            <div class="row text-center">
                <div class="col">
                    <h4>List of Orders</h4>
                </div>
            </div>

            <div v-if="displayPopup" class="mymodal">
                <div class="modal-content">
                    <div class="row text-center">
                        <div class="col"><h2>Edit Order Status</h2></div>
                    </div>
                    <form>
                        <div class="form-group">
                            <label for="orderID">OrderID</label>
                            <input type="text" id="orderID" :value="updatingOrder.orderID" class="form-control" disabled>
                        </div>
                        <div class="form-group">
                            <label for="timestamp">Timestamp</label>
                            <input type="text" id="timestamp" :value="updatingOrder.formatTimestamp()" class="form-control" disabled>
                        </div>
                        <div class="form-group">
                            <label for="tableID">TableID</label>
                            <input type="text" id="tableID" :value="updatingOrder.tableID" class="form-control" disabled>
                        </div>
                        <div class="form-group">
                            <label for="items">Ordered Items</label>
                            <textarea id="items" class="form-control" :value="updatingOrder.getReadableItems(menu)" disabled></textarea>
                        </div>
                        <div class="form-group">
                            <label for="orderStatus">Order Status</label>
                            <select id="orderStatus" v-model="updatingOrder.orderStatus" class="form-control">
                                <option value="Pending">Pending</option>
                                <option value="Completed">Completed</option>
                            </select>
                        </div>
                        <div class="form-group text-center">
                            <button type="button" @click="saveOrderStatus" class="btn btn-primary">Update</button>
                            <button type="button" @click="closeUpdatePopup" class="btn btn-danger">Close</button>
                        </div>
                    </form>
                </div>
            </div>

            <div id="table-responsive">
                <table class="table table-striped table-hover text-center">
                    <thead>
                        <tr>
                            <th>OrderID</th>
                            <th>Timestamp</th>
                            <th>TableID</th>
                            <th class="col-5">Items</th>
                            <th>Order Status</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="order in orderList" :key="order.orderID">
                            <td>{{order.orderID}}</td>
                            <td>{{order.formatTimestamp()}}</td>
                            <td>{{order.tableID}}</td>
                            <td>{{order.getReadableItems(menu)}}</td>
                            <td>{{order.orderStatus}}</td>
                            <td><a href="#" @click="updateOrder(order); openUpdatePopup()">Update</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

class Order {
    constructor(orderID, timestamp, tableID, items, orderStatus, paymentDetails) {
        this.orderID = orderID;
        this.timestamp = timestamp;
        this.tableID = tableID;
        this.items = items;
        this.orderStatus = orderStatus;
        this.PaymentDetails = paymentDetails;
    }

    formatTimestamp() {
        const date = new Date(this.timestamp);
        const formattedDate = date.toISOString().slice(0, 10); // YYYY-MM-DD
        const formattedTime = date.toTimeString().slice(0, 8); // HH:MM:SS
        return `${formattedDate} ${formattedTime}`;
    }

    getReadableItems(menu) {
        try {
            const items = JSON.parse(this.items);
            return items.map(item => {
                const menuItem = menu.find(menuItem => menuItem.itemID == item.ItemID);
                return menuItem ? `${menuItem.itemName} x${item.Quantity}` : `Unknown Item x${item.Quantity}`;
            }).join('\n');
        } catch (error) {
            console.error('Error parsing items JSON:', error);
            return 'Invalid items data';
        }
    }
}

class MenuItem {
    constructor(itemID, itemName) {
        this.itemID = itemID;
        this.itemName = itemName;
    }
}

export default {
    name: 'OrderTable',
    data() {
        return {
            orderList: [],
            displayPopup: false,
            updatingOrder: new Order('', '', '', '', '',''),
            menu: [],
            observers: []
        };
    },
    methods: {
        addObserver(observer) {
            this.observers.push(observer);
        },
        notifyObservers() {
            this.observers.forEach(observer => observer.update(this.orderList));
        },
        updateOrder(order) {
            this.updatingOrder = order;
        },
        openUpdatePopup() {
            this.displayPopup = true;
        },
        closeUpdatePopup() {
            this.displayPopup = false;
            this.updatingOrder = new Order('', '', '', '', '');
        },
        saveOrderStatus() {
            axios.put(`http://localhost:3000/orders/${this.updatingOrder.orderID}`, {
                OrderStatus: this.updatingOrder.orderStatus, // Ensure correct field name
                PaymentDetails: this.updatingOrder.PaymentDetails
            })
            .then(response => {
                this.closeUpdatePopup();
                this.fetchOrders(); // Fetch orders again to update the table without reloading the page
            })
            .catch(error => {
                console.error('There was an error updating the order status:', error);
            });
        },
        fetchOrders() {
            axios.get('http://localhost:3000/orders')
            .then(response => {
                this.orderList = response.data.map(orderData => 
                    new Order(orderData.OrderID, orderData.Timestamp, orderData.TableID, orderData.Items, orderData.OrderStatus, orderData.PaymentDetails)
                );
                this.notifyObservers();
            })
            .catch(error => {
                console.error('There was an error fetching the orders:', error);
            });
        },
        fetchMenu() {
            axios.get('http://localhost:3000/menu')
            .then(response => {
                this.menu = response.data.map(menuItemData => 
                    new MenuItem(menuItemData.ItemID, menuItemData.ItemName)
                );
            })
            .catch(error => {
                console.error('There was an error fetching the menu:', error);
            });
        }
    },
    created() {
        this.fetchOrders();
        this.fetchMenu();
    }
};
</script>

<style scoped>
    #table-responsive {
        overflow-y: scroll;
        height: 400px;
    }
    .tablecontainer {
        position: relative;
        max-width: 85%; 
        background-color: lightgrey;
        border: 1px solid black;
        border-radius: 5px;
    }
    thead {
        position: sticky;
        top: 0;
        background-color: white;
    }

    /* The Modal (background) */
    .mymodal {
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 70%;
        max-width: 800px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .form-group {
        margin-bottom: 1rem;
    }

    .form-control {
        width: 100%;
        padding: 0.5rem;
        margin: 0.5rem 0;
    }

    .btn {
        margin: 0.5rem;
    }
</style>
