<template>
  <div class="container">
    <h1 class="my-4">Reservation</h1>
    <form >
      <div class="form-group row">
        <label for="fullName" class="col-sm-2 col-form-label">Name:</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="fullName" v-model="form.fullName" placeholder="Name" required/>
        </div>
      </div>
      <div class="form-group row mt-3">
        <label for="date" class="col-sm-2 col-form-label">Date:</label>
        <div class="col-sm-10">
          <input type="date" class="form-control" id="date" v-model="form.date" name="date" required/>
        </div>
      </div>
      <div class="form-group row mt-3">
        <label for="time" class="col-sm-2 col-form-label">Time:</label>
        <div class="col-sm-10">
          <input type="time" class="form-control" id="time" v-model="form.time" name="time" required />
        </div>
      </div>
      <div class="form-group row mt-3">
        <label for="guests" class="col-sm-2 col-form-label">Guests:</label>
        <div class="col-sm-10 ">
          <input type="number" class="form-control" id="guests" v-model="form.guests" name="guests" required/>
        </div>
      </div>
      <div class="form-group row mt-3">
        <div class="col-sm-10 offset-sm-2">
          <button type="submit">Submit</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'ReservationBooking',
  data() {
    return {
      form: {
        fullName: '',
        date: '',
        time: '',
        guests: 1,
      },
    }
  }
}
</script>

<style>

</style>
