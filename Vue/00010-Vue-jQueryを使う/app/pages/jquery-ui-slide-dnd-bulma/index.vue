<template>
  <div class="columns">
    <div id="side-bar" class="column is-3">
      <div class="card" style="margin: 10px">
        <div class="card-content">
          <div class="content">
            Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros.
            Donec id elit non mi porta gravida at eget metus. Cum sociis natoque
            penatibus et magnis dis parturient montes, nascetur ridiculus mus.
            Cras mattis consectetur purus sit amet fermentum.
          </div>
        </div>
      </div>
      <div class="card" style="margin: 10px">
        <div class="card-content">
          <div class="content">
            Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros.
            Donec id elit non mi porta gravida at eget metus. Cum sociis natoque
            penatibus et magnis dis parturient montes, nascetur ridiculus mus.
            Cras mattis consectetur purus sit amet fermentum.
          </div>
        </div>
      </div>
      <div class="card" style="margin: 10px">
        <div class="card-content">
          <div class="content">
            Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros.
            Donec id elit non mi porta gravida at eget metus. Cum sociis natoque
            penatibus et magnis dis parturient montes, nascetur ridiculus mus.
            Cras mattis consectetur purus sit amet fermentum.
          </div>
        </div>
      </div>
      <div class="card" style="margin: 10px">
        <div class="card-content">
          <div class="content">
            Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros.
            Donec id elit non mi porta gravida at eget metus. Cum sociis natoque
            penatibus et magnis dis parturient montes, nascetur ridiculus mus.
            Cras mattis consectetur purus sit amet fermentum.
          </div>
        </div>
      </div>
      <div class="card" style="margin: 10px">
        <div class="card-content">
          <div class="content">
            Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros.
            Donec id elit non mi porta gravida at eget metus. Cum sociis natoque
            penatibus et magnis dis parturient montes, nascetur ridiculus mus.
            Cras mattis consectetur purus sit amet fermentum.
          </div>
        </div>
      </div>
      <div class="card" style="margin: 10px">
        <div class="card-content">
          <div class="content">
            Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros.
            Donec id elit non mi porta gravida at eget metus. Cum sociis natoque
            penatibus et magnis dis parturient montes, nascetur ridiculus mus.
            Cras mattis consectetur purus sit amet fermentum.
          </div>
        </div>
      </div>
      <div class="card" style="margin: 10px">
        <div class="card-content">
          <div class="content">
            Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros.
            Donec id elit non mi porta gravida at eget metus. Cum sociis natoque
            penatibus et magnis dis parturient montes, nascetur ridiculus mus.
            Cras mattis consectetur purus sit amet fermentum.
          </div>
        </div>
      </div>
    </div>
    <div id="main-area" class="column is-9">
      メインエリア
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      adjustHeigth: 10,
      slideItemList: [
        {
          title: "slide1"
        },
        {
          title: "slide2"
        },
        {
          title: "slide3"
        },
        {
          title: "slide4"
        },
        {
          title: "slide5"
        }
      ]
    };
  },
  mounted() {
    this.setUpDomHeight();
    this.detectResize()
  },
  methods: {
    detectResize() {
      window.addEventListener("resize", (event) => {
        console.log(event)
        this.setUpDomHeight()
      })
    },
    getMaxHeight() {
      return Math.max(
        document.body.scrollHeight,
        document.body.offsetHeight,
        document.body.clientHeight,
        window.innerHeight
      );
    },
    setUpDomHeight() {
      this.$nextTick(() => {
        const sideBarDom = document.getElementById("side-bar");
        const mainAreaDom = document.getElementById("main-area");
        sideBarDom.style.height = this.getMaxHeight() + this.adjustHeigth + "px";
        mainAreaDom.style.height = this.getMaxHeight() + "px";
      });
    }
  }
};
</script>

<style>
* {
  box-sizing: border-box;
}

#side-bar {
  background-color: bisque;
  padding-right: 0px;
  height: 100%;
}

#main-area {
  background-color: darkseagreen;
  height: 100%;
}
</style>
