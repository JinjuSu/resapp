<template>
  <Navbar></Navbar>
  <RouterView></RouterView>
</template>

<script>
import HelloWorld from "./components/HelloWorld.vue";

import Navbar from "./components/NavbarComp.vue";

export default {
  name: "App",
  components: {
    HelloWorld,
    Navbar,
  },
};
</script>

<style>
#app {
  font-family: Roboto, Helvetica, Arial, sans-serif;
}
</style>
