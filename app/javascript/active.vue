<template>
  <vue-datepicker-local v-model="time" />
</template>

<script>
import VueDatepickerLocal from 'vue-datepicker-local'

export default {
  components: {
    VueDatepickerLocal
  },
  data () {
    return {
      time: new Date(),
      range: [new Date(),new Date()],
    }
  }
}
</script>