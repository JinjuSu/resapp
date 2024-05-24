<template>
    <div class="container-fluid p-3 container-bottom-shadow">
        <div class="row align-items-center">
            <div class="col-6">
                <button class="btn btn-outline-secondary d-flex align-items-center justify-content-start" @click="logout()">Logout</button>
            </div>
            <div class="col-6">
                <h5 class="d-flex align-items-center justify-content-end"><img src="../assets/1144760.png" style="max-width: 30px; margin-right: 10px;">Kitchen</h5>
            </div>
        </div>
    </div>
</template>

<script>
    export default{
        name: 'NavComponent',
        methods:{
            logout(){
                this.$router.replace({ name: 'login' });
            }
        }
    }
</script>

<style scoped>
    .container-bottom-shadow {
        box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.2); /* Customize shadow properties as needed */
    }
</style>