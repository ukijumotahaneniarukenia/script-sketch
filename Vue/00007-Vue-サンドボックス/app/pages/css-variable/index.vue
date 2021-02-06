<<template>
  <div id="anims">
    <div class="anim anim-1"></div>
    <div class="anim anim-2"></div>
    <div class="anim anim-3"></div>
  </div>
</template>

<script>
export default {
  mounted() {
    this.hoge();
  },
  methods: {
    hoge() {
      const appendToDom = document.getElementById("anims");
      const targetDom = document.createElement("div");
      targetDom.classList.add("anim");
      targetDom.style.setProperty("--max", Math.random() * 100 + "%");
      // ランダムな終了時の値を指定
      // ポイント: targetDomement.style.setProperty で変数を指定できる
      appendToDom.appendChild(targetDom);
    }
  }
};
</script>

<style>
@keyframes anim {
  from {
    width: 0;
  }
  to {
    width: var(--max);
  }
  /* ポイント: @keyframes 内で変数を参照できる */
}

.anim {
  background: #1bb8f3;
  height: 30px;
  margin: 10px;
  width: 0;
  animation: anim linear 2s infinite alternate;
}

.anim-1 {
  --max: 50%;
}

.anim-2 {
  --max: 30%;
}

.anim-3 {
  --max: 10%;
}
</style>
