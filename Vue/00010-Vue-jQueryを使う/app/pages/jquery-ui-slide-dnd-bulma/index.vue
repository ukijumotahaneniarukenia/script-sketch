<template>
  <div class="columns">
    <div id="side-bar" class="column is-3">
      <div class="is-flex is-justify-content-center" style="margin:5px">
        <button id="add-slide" type="button" class="button is-success" @click="addFirstSlide($event)">
          <span class="icon"><i class="mdi mdi-plus" style="font-size: 32px;"></i></span>
        </button>
      </div>
      <div v-for="(slideItem, index) in slideItemList" :key="index" >
        <div
          class="card"
          style="margin: 10px"
          @mouseover="showDeleteSlideButton('delete-slide-button-' + (index + 1))"
          @mouseleave="hideDeleteSlideButton('delete-slide-button-' + (index + 1))"
        >
          <div class="card-content">
            <button
              :id="'delete-slide-button-' + (index + 1)"
              type="button"
              class="button is-danger"
              style="position: absolute;top:5px;right:5px;display:none;"
              @click="deleteSlide(index + 1)"
            >
              <span class="icon"><i class="mdi mdi-minus" style="font-size: 32px;"></i></span>
            </button>
            <figure>
              <img :id="'side-bar-slide-' + (index + 1)" :src="slideItem.materialSrcPath">
            </figure>
          </div>
        </div>
        <div class="is-flex is-justify-content-center" style="margin:5px">
          <button id="add-slide" type="button" class="button is-success" @click="addSlide(index + 1)">
            <span class="icon"><i class="mdi mdi-plus" style="font-size: 32px;"></i></span>
          </button>
        </div>
      </div>
    </div>
    <div id="main-area" class="column is-9">
      <div id="main-area-header">
        <div class="navbar-menu">
          <div class="navbar-start">
            <button class="button is-success" style="margin: 5px">Success</button>
            <button class="button is-success" style="margin: 5px">Success</button>
            <button class="button is-success" style="margin: 5px">Success</button>
          </div>

          <div class="navbar-end">
            <button class="button is-success" style="margin: 5px">Success</button>
            <button class="button is-success" style="margin: 5px">Success</button>
            <button class="button is-success" style="margin: 5px">Success</button>
          </div>
        </div>
      </div>
      <div id="main-area-workspace">
        <div id="main-area-workspace-header">
          <div class="navbar-menu">
            <div class="navbar-start">
              <button class="button is-info is-light" style="margin: 5px">Info</button>
              <button class="button is-info is-light" style="margin: 5px">Info</button>
              <button class="button is-info is-light" style="margin: 5px">Info</button>
            </div>

            <div class="navbar-end">
              <button class="button is-info is-light" style="margin: 5px">Info</button>
              <button class="button is-info is-light" style="margin: 5px">Info</button>
              <button class="button is-info is-light" style="margin: 5px">Info</button>
            </div>
          </div>
        </div>
        <div id="main-area-workspace-content">
          <div v-for="(slideItem, index) in slideItemList" :key="index" >
            <div v-if="slideItem.materialSrcPath !== dummySlideItemMaterialSrcPath">
              <figure>
                <img :id="'slide-' + (index + 1)" :src="slideItem.materialSrcPath">
              </figure>
            </div>
            <div
              v-if="slideItem.materialSrcPath === dummySlideItemMaterialSrcPath"
              class="is-flex is-justify-content-center dummy-slide"
              style="margin: 5px"
            >
              <div class="file is-large is-boxed">
                <label class="file-label">
                  <input :id="'detect-file-upload-' + (index + 1)" class="file-input" type="file" name="resume" @change="detectFileUpload($event)">
                  <span class="file-cta">
                    <span class="icon"><i class="mdi mdi-cloud-upload" style="font-size: 32px;"></i></span>
                    <div class="">
                      Upload Image or Movie
                    </div>
                  </span>
                </label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      dummySlideItemMaterialSrcPath : 'https://bulma.io/images/placeholders/640x480.png',
      adjustHeigth: 12,
      slideItemList: [
        // {
        //   materialSrcPath: "/images/Coffee-Big-PNG-Image.png"
        // },
        // {
        //   materialSrcPath: "/images/down-tiger-png-10212.png"
        // },
        // {
        //   materialSrcPath: "/images/Healthy-Food-Transparent-PNG-Picture.png"
        // },
        // {
        //   materialSrcPath: "/images/Naughty-Bart-Simpson-Clipart2.png"
        // },
      ]
    };
  },
  mounted() {
    this.setUpDomHeight();
    this.detectResize();
  },
  methods: {
    detectFileUpload(event) {
      console.log("detectFileUpload")
      const targetInputDomId = event.target.id
      const targetSlideNumber = Number(targetInputDomId.replace(/detect-file-upload-/,""))
      const targetUploadFileList = Array.from(event.target.files)
      targetUploadFileList.map(targetUploadFile => {
        const pushItem = {
          materialSrcPath: URL.createObjectURL(targetUploadFile),
          fileType: targetUploadFile.type
        }
        this.slideItemList.splice(targetSlideNumber-1, 1, pushItem)
        this.setUpDomHeight();
      })
    },
    showDeleteSlideButton(targetDeleteSlideButtonDomId) {
      console.log("showDeleteSlideButton")
      const targetDeleteSlideButtonDom = document.getElementById(targetDeleteSlideButtonDomId)
      targetDeleteSlideButtonDom.style.display = 'block'
    },
    hideDeleteSlideButton(targetDeleteSlideButtonDomId) {
      console.log("hideDeleteSlideButton")
      const targetDeleteSlideButtonDom = document.getElementById(targetDeleteSlideButtonDomId)
      targetDeleteSlideButtonDom.style.display = 'none'
    },
    addFirstSlide(event) {
      console.log("addFirstSlide")
      console.log(event)
      const pushItem = {
        materialSrcPath: this.dummySlideItemMaterialSrcPath
      }
      this.slideItemList.splice(0, 0, pushItem)
      this.setUpDomHeight();
    },
    deleteSlide(targetSlideNumber) {
      console.log("deleteSlide")
      console.log(targetSlideNumber)
      this.slideItemList.splice(targetSlideNumber-1, 1)
      this.setUpDomHeight();
    },
    addSlide(targetSlideNumber) {
      console.log("addSlide")
      console.log(targetSlideNumber)
      const pushItem = {
        materialSrcPath: this.dummySlideItemMaterialSrcPath
      }
      this.slideItemList.splice(targetSlideNumber, 0, pushItem)
      this.setUpDomHeight();
    },
    detectResize() {
      window.addEventListener("resize", event => {
        console.log(event);
        this.setUpDomHeight();
      });
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
        sideBarDom.style.setProperty("--side-bar-margin-top", this.adjustHeigth + "px")
        sideBarDom.style.height =
          window.innerHeight + "px";
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
  --side-bar-margin-top: 12px;
  background-color: bisque;
  margin-top: var(--side-bar-margin-top);
  padding-right: 0px;
  overflow-y: scroll;
  position:sticky;
  top:0px;
}

#main-area {
  background-color: darkseagreen;
  padding-left: 0px;
  height: 100%;
}

#main-area-header {
  position: sticky;
  top: 0px;
  background-color: darkgray;
  height: 50px;
}

#main-area-workspace-header {
  background-color: cadetblue;
  position: sticky;
  top: 0px;
  z-index: 1;
}

.dummy-slide {
  height: 1200px; /* 考えるところ */
}
</style>
