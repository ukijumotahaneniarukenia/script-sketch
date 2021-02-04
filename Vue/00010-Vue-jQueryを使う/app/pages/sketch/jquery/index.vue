<template>
  <div>
    <button id="btn">クリックでテキスト挿入</button>
    <p id="hogehoge"></p>
  </div>
</template>

<script>
export default {
  mounted: function () {
    $("#btn").click(function () {
      $("#hogehoge").text("テキスト挿入");
    });
  },
};
</script>
