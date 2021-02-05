<template>
  <div>
    <button id="insert-text-button">クリックでテキスト挿入</button>
    <p id="insert-text-area"></p>
    <p class="typist"></p>
  </div>
</template>

<script>
export default {
  mounted() {
    this.insertText();
    this.typistDemo();
  },
  methods: {
    insertText() {
      $("#insert-text-button").click(event => {
        console.log(event);
        $("#insert-text-area").text("テキスト挿入");
      });
    },
    typistDemo() {
      // http://albburtsev.github.io/jquery.typist/
      console.log($(".typist"))
      $(".typist")
        .typist({
          speed: 12,
          text: "Hello!\n"
        })
        .typistAdd("It's working!");
    }
  }
};
</script>
