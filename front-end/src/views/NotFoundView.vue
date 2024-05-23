<template>
  <div class="container text-center my-5">
    <h1>404: Page Not Found</h1>
    <p>Please check your url</p>
    <button><router-link to="/">Go to home</router-link></button>
  </div>
</template>

<script>
export default {
  name: "NotFound",
};
</script>
