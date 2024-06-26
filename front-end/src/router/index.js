import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import MenuView from "../views/MenuView.vue";
import CartView from "../views/CartView.vue";
import PaymentView from "../views/PaymentView.vue";
import OrdersView from "../views/OrdersView.vue";
import LoginView from "../views/LoginView.vue";
import ReservationView from "../views/ReservationView.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/menu",
    name: "menu",
    component: MenuView,
  },
  {
    path: "/cart",
    name: "cart",
    component: CartView,
  },
  {
    path: "/payment/:orderID",
    name: "payment",
    component: PaymentView,
    props: true,
  },
  {
    path: "/order",
    name: "order",
    component: OrdersView,
  },
  {
    path: "/login",
    name: "login",
    component: LoginView,
  },
  {
    path: "/reservations",
    name: "reservations",
    component: ReservationView,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
