<template>
  <div id="main-page">
    <div id="header-pane">
      <b-button
        label="openTopSidebar"
        type="is-info"
        icon-left="check"
        @click="openTopSidebar"
      />
      <b-button
        label="openBottomSidebar--Buggy-Difficulte"
        type="is-info"
        icon-left="check"
        @click="openBottomSidebar"
      />
      <b-button
        label="openLeftSidebar"
        type="is-info"
        icon-left="check"
        @click="openLeftSidebar"
      />
      <b-button
        label="openRightSidebar"
        type="is-info"
        icon-left="check"
        @click="openRightSidebar"
      />
    </div>
    <div class="columns" style="margin: 0px">
      <div id="left-pane" class="column is-3" style="padding-top: 0px;padding-right: 0px;">Left Pane</div>
      <div id="right-pane" class="column is-9" style="padding-top: 0px;padding-right: 0px;">Right Pane</div>
    </div>
    <div id="top-side-bar">
      <div style="position: relative;">
        <a
          class="delete is-large"
          @click="closeTopSidebar"
          style="position: absolute;top:5px;right:5px"
        ></a>
        トップサイドバー
      </div>
    </div>
    <div id="left-side-bar">
      <div style="position: relative;">
        <a
          class="delete is-large"
          @click="closeLeftSidebar"
          style="position: absolute;top:5px;right:5px"
        ></a>
        レフトサイドバー
      </div>
    </div>
    <div id="right-side-bar">
      <div style="position: relative;">
        <a
          class="delete is-large"
          @click="closeRightSidebar"
          style="position: absolute;top:5px;right:5px"
        ></a>
        ライトサイドバー
      </div>
    </div>
    <div id="bottom-side-bar">
      <div style="position: relative;">
        <a
          class="delete is-large"
          @click="closeBottomSidebar"
          style="position: absolute;top:5px;right:5px"
        ></a>
        ボトムサイドバー
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      topSideBarHeight: 500,
      topSideBarTopOffset: 0,
      bottomSideBarHeight: 300,
      bottomSideBarBottomOffset: 0,
      leftSideBarWidth: 500,
      rightSideBarWidth: 700,
      leftPaneHeight: 2000,
      rightPaneHeight: 2000,
      headerPaneHeight: 100,
    };
  },
  mounted() {
    this.getEntryNode();
    this.setUpSize();
    this.detectWindowScroll();
  },
  created() {
    this.initialize();
  },
  methods: {
    getCssPropsValue(targetDom,targetPropsName) {
      return Number(window.getComputedStyle(targetDom).getPropertyValue(targetPropsName).replace(/px/,""))
    },
    adjustTopSideBar() {
      console.log("adjustTopSideBar")
      const topSidebar = document.getElementById("top-side-bar");
      topSidebar.style.setProperty("--move-to-offset-y-for-top-side-bar", window.scrollY + 'px');
      console.log(this.getCssPropsValue(topSidebar,"--move-to-offset-y-for-top-side-bar"))
    },
    adjustBottomSideBar() {
      console.log("adjustBottomSideBar")
      const bottomSidebar = document.getElementById("bottom-side-bar");
      bottomSidebar.style.setProperty("--move-to-offset-y-for-bottom-side-bar", window.scrollY + 'px');
      if (this.getCssPropsValue(bottomSidebar,"--move-to-previous-offset-y-for-bottom-side-bar") > this.getCssPropsValue(bottomSidebar,"--move-to-offset-y-for-bottom-side-bar")) {
        console.log("up scroll")
      } else {
        console.log("down scroll")
        console.log(this.getCssPropsValue(bottomSidebar,"bottom") )
        console.log(this.getCssPropsValue(bottomSidebar,"--move-to-offset-y-for-bottom-side-bar") - this.getCssPropsValue(bottomSidebar,"--move-to-previous-offset-y-for-bottom-side-bar"))
        bottomSidebar.style.setProperty("bottom", this.getCssPropsValue(bottomSidebar,"bottom") - (this.getCssPropsValue(bottomSidebar,"--move-to-offset-y-for-bottom-side-bar")-this.getCssPropsValue(bottomSidebar,"--move-to-previous-offset-y-for-bottom-side-bar")) + 'px');
        console.log(this.getCssPropsValue(bottomSidebar,"bottom"))
      }
      bottomSidebar.style.setProperty("--move-to-previous-offset-y-for-bottom-side-bar", this.getCssPropsValue(bottomSidebar,"--move-to-offset-y-for-bottom-side-bar") + 'px');
    },
    adjustLeftSideBar() {
      const leftSidebar = document.getElementById("left-side-bar");
      leftSidebar.style.top = window.scrollY + 'px';
    },
    adjustRightSideBar() {
      const rightSidebar = document.getElementById("right-side-bar");
      rightSidebar.style.top = window.scrollY + 'px';
    },
    adjustLeftPane(targetScrollY) {
      const leftPane = document.getElementById("left-pane");
      leftPane.style.height = (window.innerHeight + targetScrollY) + 'px';
      leftPane.style.paddingBottom = (window.innerHeight + targetScrollY) + 'px'
    },
    adjustRightPane(targetScrollY) {
      const rightPane = document.getElementById("right-pane");
      rightPane.style.height = (window.innerHeight + targetScrollY) + 'px';
      rightPane.style.paddingBottom = (window.innerHeight + targetScrollY) + 'px'
    },
    openBottomSidebar() {
      console.log("openBottomSidebar");
      const targetDom = document.getElementById("bottom-side-bar");
      console.log(this.getCssPropsValue(targetDom,"bottom"))
      targetDom.classList = ''
      targetDom.classList.add("bottom-side-bar-open");
      targetDom.style.setProperty("--move-to-y-for-bottom-side-bar", this.getCssPropsValue(targetDom,"bottom") + 'px');
    },
    closeBottomSidebar() {
      console.log("closeBottomSidebar");
      const targetDom = document.getElementById("bottom-side-bar");
      console.log(this.getCssPropsValue(targetDom,"bottom"))
      targetDom.classList = ''
      targetDom.classList.add("bottom-side-bar-close");
      targetDom.style.setProperty("--move-to-y-for-bottom-side-bar", this.getCssPropsValue(targetDom,"bottom") + 'px');
    },
    openTopSidebar() {
      console.log("openTopSidebar");
      const targetDom = document.getElementById("top-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("top-side-bar-open");
      targetDom.style.setProperty("--move-to-y-for-top-side-bar", - (this.topSideBarHeight-this.getCssPropsValue(targetDom, "--move-to-offset-y-for-top-side-bar")) + 'px');
      console.log(window.getComputedStyle(targetDom).getPropertyValue("--move-to-y-for-top-side-bar"));
    },
    closeTopSidebar() {
      console.log("closeTopSidebar");
      const targetDom = document.getElementById("top-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("top-side-bar-close");
      targetDom.style.setProperty("--move-to-y-start-for-top-side-bar", - this.topSideBarHeight + 'px');
      targetDom.style.setProperty("--move-to-y-for-top-side-bar", - (this.topSideBarHeight-this.getCssPropsValue(targetDom, "--move-to-offset-y-for-top-side-bar")) + 'px');
      // https://stackoverflow.com/questions/22677954/simple-javascript-getproperty-function-cannot-access-css-styles-even-though-it
      console.log(this.getCssPropsValue(targetDom, "--move-to-y-for-top-side-bar"))
    },
    openLeftSidebar() {
      console.log("openLeftSidebar");
      const targetDom = document.getElementById("left-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("left-side-bar-open");
      targetDom.style.setProperty("--move-to-x-for-left-side-bar", - this.leftSideBarWidth + 'px');
      console.log(this.getCssPropsValue(targetDom, "--move-to-x-for-left-side-bar"))
    },
    closeLeftSidebar() {
      console.log("closeLeftSidebar");
      const targetDom = document.getElementById("left-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("left-side-bar-close");
      targetDom.style.setProperty("--move-to-x-for-left-side-bar", - this.leftSideBarWidth + 'px');
      // https://stackoverflow.com/questions/22677954/simple-javascript-getproperty-function-cannot-access-css-styles-even-though-it
      console.log(this.getCssPropsValue(targetDom, "--move-to-x-for-left-side-bar"))
    },
    openRightSidebar() {
      console.log("openRightSidebar");
      const targetDom = document.getElementById("right-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("right-side-bar-open");
      targetDom.style.setProperty("--move-to-x-for-right-side-bar", -this.rightSideBarWidth + 'px');
      // https://stackoverflow.com/questions/22677954/simple-javascript-getproperty-function-cannot-access-css-styles-even-though-it
      console.log(this.getCssPropsValue(targetDom, "--move-to-x-for-right-side-bar"))
    },
    closeRightSidebar() {
      console.log("closeRightSidebar");
      const targetDom = document.getElementById("right-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("right-side-bar-close");
      targetDom.style.setProperty("--move-to-x-for-right-side-bar", -this.rightSideBarWidth + 'px');
      // https://stackoverflow.com/questions/22677954/simple-javascript-getproperty-function-cannot-access-css-styles-even-though-it
      console.log(this.getCssPropsValue(targetDom, "--move-to-x-for-right-side-bar"))
    },
    detectWindowScroll() {
      window.addEventListener("scroll", event => {
        // console.log(event);
        // console.log(window.scrollY);
        // console.log(window.innerWidth);
        // console.log(window.innerHeight);
        // console.log(window.document.body.scrollHeight);
        this.adjustTopSideBar()
        this.adjustBottomSideBar()
        this.adjustLeftSideBar()
        this.adjustRightSideBar()
        // this.adjustLeftPane(window.scrollY) a little difficult
        // this.adjustRightPane(window.scrollY) a little difficult
      });
    },
    setUpSize() {
      const topSidebar = document.getElementById("top-side-bar");
      const bottomSidebar = document.getElementById("bottom-side-bar");
      const leftSidebar = document.getElementById("left-side-bar");
      const rightSidebar = document.getElementById("right-side-bar");
      const headerPane = document.getElementById("header-pane");
      const leftPane = document.getElementById("left-pane");
      const rightPane = document.getElementById("right-pane");

      headerPane.style.height = this.headerPaneHeight + 'px';
      leftPane.style.paddingBottom = (this.leftPaneHeight + this.headerPaneHeight) + 'px'
      rightPane.style.paddingBottom = (this.rightPaneHeight + this.headerPaneHeight) + 'px'

      topSidebar.style.position = "absolute";
      topSidebar.style.setProperty("--move-to-y-start-for-top-side-bar", - this.topSideBarHeight + 'px');
      topSidebar.style.setProperty("--move-to-offset-y-for-top-side-bar", this.topSideBarTopOffset + 'px');
      topSidebar.style.setProperty("--move-to-y-for-top-side-bar", - (this.topSideBarHeight-this.getCssPropsValue(topSidebar, "--move-to-offset-y-for-top-side-bar")) + 'px');
      topSidebar.style.width = window.innerWidth + "px";
      topSidebar.style.height = this.topSideBarHeight + "px";

      bottomSidebar.style.position = "absolute";
      bottomSidebar.style.setProperty("--move-to-y-start-for-bottom-side-bar", (- this.bottomSideBarHeight) + 'px');
      bottomSidebar.style.setProperty("--move-to-offset-y-for-bottom-side-bar", this.bottomSideBarBottomOffset + 'px');
      bottomSidebar.style.setProperty("--move-to-previous-offset-y-for-bottom-side-bar", this.bottomSideBarBottomOffset + 'px');
      bottomSidebar.style.setProperty("--move-to-y-for-bottom-side-bar", (- this.bottomSideBarHeight) + 'px');
      bottomSidebar.style.width = window.innerWidth + "px";
      bottomSidebar.style.height = this.bottomSideBarHeight + "px";

      leftSidebar.style.position = "absolute";
      leftSidebar.style.setProperty("--move-to-x-for-left-side-bar", - this.leftSideBarWidth + 'px');
      leftSidebar.style.width = this.leftSideBarWidth + "px";
      leftSidebar.style.height = window.innerHeight + "px";

      rightSidebar.style.position = "absolute";
      rightSidebar.style.setProperty("--move-to-x-for-right-side-bar", -this.rightSideBarWidth + 'px');
      rightSidebar.style.width = this.rightSideBarWidth + "px";
      rightSidebar.style.height = window.innerHeight + "px";
    },
    initialize: function() {
      console.log("initialize");
    },
    getEntryNode: function() {
      console.log("getEntryNode");
      const targetDom = document.getElementById("main-page");
      console.log(targetDom);
    }
  }
};
</script>

<style>
*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  border: 0;
}

#header-pane {
  position: sticky;
  top: 0px;
  background-color: rgb(45, 66, 110);
}

#left-pane {
  background-color: rgb(180, 116, 116);
}

#main-pane {
  background-color: rgb(168, 201, 194);
}

#right-pane {
  background-color: rgba(122, 172, 93, 0.986);
}

#bottom-side-bar {
  --move-to-previous-offset-y-for-bottom-side-bar: 0px;
  opacity: 0;
  position: absolute;
  bottom: var(--move-to-y-for-bottom-side-bar);
  background-color: #f3e886;
}

.bottom-side-bar-open {
  animation: 0.5s move-to-up-for-bottom-side-bar forwards;
}

.bottom-side-bar-close {
  animation: 0.5s move-to-down-for-bottom-side-bar forwards;
}

#top-side-bar {
  position: absolute;
  top: var(--move-to-y-for-top-side-bar);
  background-color: #f3e886;
}

.top-side-bar-open {
  animation: 0.5s move-to-down-for-top-side-bar forwards;
}

.top-side-bar-close {
  animation: 0.5s move-to-up-for-top-side-bar forwards;
}

#left-side-bar {
  position: absolute;
  top: 0px;
  left: var(--move-to-x-for-left-side-bar);
  background-color: #f3e886;
}

.left-side-bar-open {
  animation: 0.5s move-to-right-for-left-side-bar forwards;
}

.left-side-bar-close {
  animation: 0.5s move-to-left-for-left-side-bar forwards;
}

#right-side-bar {
  position: absolute;
  top: 0px;
  right: var(--move-to-x-for-right-side-bar);
  background-color: #f3e886;
}

.right-side-bar-open {
  animation: 0.5s move-to-left-for-right-side-bar forwards;
}

.right-side-bar-close {
  animation: 0.5s move-to-right-for-right-side-bar forwards;
}

@keyframes move-to-right-for-left-side-bar {
  0% {
    left: var(--move-to-x-for-left-side-bar);
  }
  100% {
    left: 0px;
  }
}

@keyframes move-to-left-for-left-side-bar {
  0% {
    left: 0px;
  }
  100% {
    left: var(--move-to-x-for-left-side-bar);
  }
}

@keyframes move-to-right-for-right-side-bar {
  0% {
    right: 0px;
  }
  100% {
    right: var(--move-to-x-for-right-side-bar);
  }
}

@keyframes move-to-left-for-right-side-bar {
  0% {
    right: var(--move-to-x-for-right-side-bar);
  }
  100% {
    right: 0px;
  }
}

@keyframes move-to-down-for-top-side-bar {
  0% {
    top: var(--move-to-y-for-top-side-bar);
  }
  100% {
    top: var(--move-to-offset-y-for-top-side-bar);
  }
}

@keyframes move-to-up-for-top-side-bar {
  0% {
    top: var(--move-to-offset-y-for-top-side-bar);
  }
  95% {
    top: var(--move-to-y-for-top-side-bar);
  }
  100% {
    top: var(--move-to-y-start-for-top-side-bar);
  }
}

@keyframes move-to-down-for-bottom-side-bar {
  0% {
    opacity: 1;
    bottom: 0px;
  }
  100% {
    opacity: 0;
    bottom: var(--move-to-y-for-bottom-side-bar);
  }
}

@keyframes move-to-up-for-bottom-side-bar {
  0% {
    opacity: 1;
    bottom: var(--move-to-y-for-bottom-side-bar);
  }
  100% {
    opacity: 1;
    bottom: 0px;
  }
}
</style>
