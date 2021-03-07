<template>
  <div id="app">
    <div
      class="rounded-t-xl overflow-hidden bg-gradient-to-r from-emerald-50 to-teal-100 p-10"
    >
      <img
        class="float-right mt-2 mr-0 mb-4 ml-10 h-32"
        src="placeholder-emerald.svg"
      />
      <p class="text-emerald-500 font-flow text-justify font-medium">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis
        et lorem sit amet vehicula. Etiam vel nibh nec nisi euismod mollis
        ultrices condimentum velit. Proin velit libero, interdum ac rhoncus sit
        amet, pellentesque ac turpis. Quisque ac luctus turpis, vel efficitur
        ante. Cras convallis risus vel vehicula dapibus. Donec eget neque
        fringilla, faucibus mi quis, porttitor magna. Cras pellentesque leo est,
        et luctus neque rutrum eu. Aliquam consequat velit sed sem posuere,
        vitae sollicitudin mi consequat. Mauris eget ipsum sed dui rutrum
        fringilla. Donec varius vehicula magna sit amet auctor. Ut congue
        vehicula lectus in blandit. Vivamus suscipit eleifend turpis, nec
        sodales sem vulputate a. Curabitur pulvinar libero viverra, efficitur
        odio eu, finibus justo. Etiam eu vehicula felis.
      </p>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>

/* chrome拡張のcopy stylesで取得したstyles property */

#app {
  tab-size: 4;
  --tw-bg-opacity: 1;
  --tw-text-opacity: 1;
  color: rgba(107, 114, 128, var(--tw-text-opacity));
  -webkit-font-smoothing: antialiased;
  font-family: inherit;
  line-height: inherit;
  box-sizing: border-box;
  border: 0 solid #e5e7eb;
  --tw-shadow: 0 0 transparent;
  --tw-ring-inset: var(--tw-empty, /*!*/ /*!*/);
  --tw-ring-offset-width: 0px;
  --tw-ring-offset-color: #fff;
  --tw-ring-color: rgba(59, 130, 246, 0.5);
  --tw-ring-offset-shadow: 0 0 transparent;
  --tw-ring-shadow: 0 0 transparent;
  background-image: linear-gradient(to right, var(--tw-gradient-stops));
  --tw-gradient-from: #ecfdf5;
  --tw-gradient-stops: var(--tw-gradient-from),
    var(--tw-gradient-to, rgba(236, 253, 245, 0));
  --tw-gradient-to: #ccfbf1;
  border-top-left-radius: 0.75rem;
  border-top-right-radius: 0.75rem;
  overflow: hidden;
  padding: 2.5rem;
}

/* 自前で取得したstyles property*/
/* CSS変数が取得できていない */
/* ブラウザデフォルトの値が取得できていない */

.bg-gradient-to-r {
  background-image: linear-gradient(to right, var(--tw-gradient-stops));
}
.float-right {
  float: right;
}
.font-flow {
  font-family: Flow;
}
.h-32 {
  height: 8rem;
}
.ml-10 {
  margin-left: 2.5rem;
}
.mr-0 {
  margin-right: 0px;
}
.mt-2 {
  margin-top: 0.5rem;
}
.rounded-r-xl,
.rounded-t-xl {
  border-top-right-radius: 0.75rem;
}
.rounded-t-xl {
  border-top-left-radius: 0.75rem;
}
.text-emerald-500 {
  --tw-text-opacity: 1;
  color: rgba(16, 185, 129, var(--tw-text-opacity));
}
.text-justify {
  text-align: justify;
}
img,
video {
  max-width: 100%;
  height: auto;
}
img,
video {
  max-width: 100%;
  height: auto;
}
</style>
