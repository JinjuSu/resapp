<template>
  <div class="orders">
    <NavComponent></NavComponent>
    <OrderTable></OrderTable>
  </div>
</template>

<script>
  import NavComponent from '@/components/NavComponent.vue'
  import OrderTable from '@/components/OrderTable.vue'

  export default{
    name: 'OrdersView',
    components:{
            NavComponent,
            OrderTable
        }
  }
</script>
