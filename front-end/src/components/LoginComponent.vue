<template>
    <div class="container" style="max-width: 400px;">
        <div class="align-items-center">
            <h2 class="text-center"><strong>User Login</strong></h2><br>
            <div class="login-box">
                <form ref="form">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username"  name="username" v-model="input.username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" v-model="input.password" required>
                    </div>
                    <div class="buttons text-center">
                        <button class="btn btn-success" @click.prevent="login()">Login</button>
                        <button type="reset" class="btn btn-danger" @click="reset()">Reset</button>
                    </div>
                    <div v-if="msg" class="alert alert-danger mt-3">{{ msg }}</div>
                </form>
            </div>  
        </div>
    </div>
</template>

<script>
    export default{
        name: 'LoginComponent',
        data(){
            return{
                msg:'',
                input: {
                    username: "",
                    password: ""
                },
            }
        },
        methods:{
            login() {
                const { username, password } = this.input;
                if (username == 'admin' && password == 'testing') {
                    this.$router.replace({ name: 'order' });
                } else {
                    this.msg = 'Invalid username or password';
                }
            },
            reset(){
                this.msg = '';
            }
        }
    }
</script>

<style scoped>
    .login-box{
        border: 1px solid black;
        padding: 30px;
        border-radius: 10px;

    }
    .form-group{
        text-align: left;
        margin-bottom:10px;
    }
    .form-control{
        background-color: lightgrey;
    }
    .buttons{
        margin-top: 1em;
    }
    .btn:first-child{
        margin-right: 10px;
    }
</style>