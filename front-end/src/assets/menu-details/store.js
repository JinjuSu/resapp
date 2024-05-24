import { reactive } from "vue";

export const store = reactive({
  cartItems: [],
  addToCart(item) {
    const existingItem = this.cartItems.find((i) => i.ItemID === item.ItemID);
    if (existingItem) {
      existingItem.Quantity++;
      existingItem.TotalPrice = existingItem.Quantity * existingItem.Price;
    } else {
      this.cartItems.push({ ...item, Quantity: 1, TotalPrice: item.Price });
    }
  },
  removeFromCart(itemID) {
    this.cartItems = this.cartItems.filter((i) => i.ItemID !== itemID);
  },
  updateQuantity(itemID, quantity) {
    const item = this.cartItems.find((i) => i.ItemID === itemID);
    if (item) {
      item.Quantity = quantity;
      item.TotalPrice = item.Quantity * item.Price;
    }
  },
});
