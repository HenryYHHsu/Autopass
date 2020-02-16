<template>
  <vue-datepicker-local v-model="range" />
</template>

<script>
import VueDatepickerLocal from 'vue-datepicker-local'

export default {
  components: {
    VueDatepickerLocal
  },
  data () {
    return {
      time: new moment().format('l'),
      range: [new moment().format('l'),newmoment().format('l')],
    }
  }
}
</script>