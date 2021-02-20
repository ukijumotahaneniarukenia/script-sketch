<template>
  <!-- https://antoniandre.github.io/wave-ui/splitter -->
  <!-- https://antoniandre.github.io/splitpanes/ -->
  <div>
    <splitpanes
      id="pane-content"
      class="default-theme"
      horizontal
      :push-other-panes="false"
    >
      <pane id="pane-content-header">
        <splitpanes id="pane-top" :push-other-panes="false">
          <pane :id="'pane-top-' + i " v-for="i in 4" :key="i">
            <div>{{ i }}</div>
          </pane>
        </splitpanes>
      </pane>
      <pane id="pane-content-main">
        <splitpanes id="pane-center" :push-other-panes="false">
          <pane :id="'pane-center-' + i" v-for="i in 8" :key="i + 4">
            <div>{{ i }}</div>
          </pane>
        </splitpanes>
      </pane>
      <pane id="pane-content-footer">
        <splitpanes id="pane-bottom" :push-other-panes="false">
          <pane :id="'pane-bottom-' + i " v-for="i in 3" :key="i + 12">
            <div>{{ i }}</div>
          </pane>
        </splitpanes>
      </pane>
    </splitpanes>
  </div>
</template>

<script>
import { Splitpanes, Pane } from "splitpanes";
import "splitpanes/dist/splitpanes.css";

export default {
  components: { Splitpanes, Pane },
  mounted() {
    this.setUp()
  },
  methods: {
    setUp() {
      const targetDom = document.getElementById("pane-content")
      targetDom.style.height = window.innerHeight + "px"
    }
  }
};
</script>

<style>
</style>
