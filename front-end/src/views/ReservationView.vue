<template>
  <div class="container">
    <h1 class="my-4">Reservation</h1>
    <form @submit.prevent="submitForm">
      <div class="form-group row">
        <label for="CustomerName" class="col-sm-2 col-form-label">Name:</label>
        <div class="col-sm-10">
          <input
            type="text"
            class="form-control"
            id="CustomerName"
            v-model="form.CustomerName"
            placeholder="Name"
            required
          />
        </div>
      </div>
      <div class="form-group row mt-3">
        <label for="date" class="col-sm-2 col-form-label">Date:</label>
        <div class="col-sm-10">
          <input
            type="date"
            class="form-control"
            id="date"
            v-model="form.Date"
            name="date"
            required
          />
        </div>
      </div>
      <div class="form-group row mt-3">
        <label for="time" class="col-sm-2 col-form-label">Time:</label>
        <div class="col-sm-10">
          <input
            type="time"
            class="form-control"
            id="time"
            v-model="formattedTime"
            name="time"
            required
          />
        </div>
      </div>
      <div class="form-group row mt-3">
        <label for="guests" class="col-sm-2 col-form-label">Guests:</label>
        <div class="col-sm-10">
          <input
            type="number"
            class="form-control"
            id="guests"
            v-model.number="form.TableID"
            name="guests"
            required
          />
        </div>
      </div>
      <div class="form-group row mt-3">
        <div class="col-sm-10 offset-sm-2">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </form>
    <div v-if="message" class="alert alert-success mt-3">
      {{ message }}
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'ReservationBooking',
  data() {
    return {
      form: {
        CustomerName: '',
        Date: new Date().toISOString().substr(0, 10),
        Time: '00:00:00',
        TableID: null,
      },
      message: '',
    };
  },
  computed: {
    formattedTime: {
      get() {
        return this.form.Time;
      },
      set(value) {
        this.form.Time = value;
      },
    },
  },
  methods: {
    async submitForm() {
      try {
        console.log('Submitting form with data:', this.form);
        const response = await axios.post('http://localhost:3000/reservations', this.form);
        console.log('Reservation submitted successfully:', response.data);
        this.message = 'Reservation submitted successfully';
        this.form = {
          CustomerName: '',
          Date: new Date().toISOString().substr(0, 10),
          Time: '12:00:00',
          TableID: null,
        };
      } catch (error) {
        console.error('Error submitting reservation:', error.response ? error.response.data : error.message);
        this.message = 'There was an error submitting your reservation. Please try again.';
      }
    },
  },
};
</script>
