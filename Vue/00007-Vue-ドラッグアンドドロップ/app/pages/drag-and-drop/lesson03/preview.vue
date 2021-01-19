<template>
  <!-- https://github.com/StackHive/DragDropInterface/blob/master/client.html -->
  <!-- https://github.com/StackHive/DragDropInterface/blob/master/demointerface.html -->
  <div id="mock-page">
    unko
    <ul>
      <li>
        u
      </li>
      <li>
        n
      </li>
      <li>
        k
      </li>
      <li>
        o
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  mounted() {
    this.initialize()
  },
  methods: {
    initialize() {
      console.log("preview init")
    },
  }
}
</script>
