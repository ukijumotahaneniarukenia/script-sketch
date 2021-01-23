<template>
  <div id="main-page">
    <div id="header-pane">
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
  </div>
</template>

<script>
export default {
  data: function() {
    return {
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
    adjustLeftSideBarTop() {
      const leftSidebar = document.getElementById("left-side-bar");
      leftSidebar.style.top = window.scrollY + 'px';
    },
    adjustRightSideBarTop() {
      const rightSidebar = document.getElementById("right-side-bar");
      rightSidebar.style.top = window.scrollY + 'px';
    },
    adjustLeftPaneHeight(targetScrollY) {
      const leftPane = document.getElementById("left-pane");
      leftPane.style.height = (window.innerHeight + targetScrollY) + 'px';
      leftPane.style.paddingBottom = (window.innerHeight + targetScrollY) + 'px'
    },
    adjustRightPaneHeight(targetScrollY) {
      const rightPane = document.getElementById("right-pane");
      rightPane.style.height = (window.innerHeight + targetScrollY) + 'px';
      rightPane.style.paddingBottom = (window.innerHeight + targetScrollY) + 'px'
    },
    openLeftSidebar() {
      console.log("openLeftSidebar");
      const targetDom = document.getElementById("left-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("left-side-bar-open");
      targetDom.style.setProperty("--move-to-x-for-left-side-bar", - this.leftSideBarWidth + 'px');
      console.log(window.getComputedStyle(targetDom).getPropertyValue("--move-to-x-for-left-side-bar"));
    },
    closeLeftSidebar() {
      console.log("closeLeftSidebar");
      const targetDom = document.getElementById("left-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("left-side-bar-close");
      targetDom.style.setProperty("--move-to-x-for-left-side-bar", - this.leftSideBarWidth + 'px');
      // https://stackoverflow.com/questions/22677954/simple-javascript-getproperty-function-cannot-access-css-styles-even-though-it
      console.log(window.getComputedStyle(targetDom).getPropertyValue("--move-to-x-for-left-side-bar"));
    },
    openRightSidebar() {
      console.log("openRightSidebar");
      const targetDom = document.getElementById("right-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("right-side-bar-open");
      targetDom.style.setProperty("--move-to-x-for-right-side-bar", -this.rightSideBarWidth + 'px');
      // https://stackoverflow.com/questions/22677954/simple-javascript-getproperty-function-cannot-access-css-styles-even-though-it
      console.log(window.getComputedStyle(targetDom).getPropertyValue("--move-to-x-for-right-side-bar"));
    },
    closeRightSidebar() {
      console.log("closeRightSidebar");
      const targetDom = document.getElementById("right-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("right-side-bar-close");
      targetDom.style.setProperty("--move-to-x-for-right-side-bar", -this.rightSideBarWidth + 'px');
      // https://stackoverflow.com/questions/22677954/simple-javascript-getproperty-function-cannot-access-css-styles-even-though-it
      console.log(window.getComputedStyle(targetDom).getPropertyValue("--move-to-x-for-right-side-bar"));
    },
    detectWindowScroll() {
      window.addEventListener("scroll", event => {
        console.log(event);
        console.log(window.scrollY);
        console.log(window.innerWidth);
        console.log(window.innerHeight);
        console.log(window.document.body.scrollHeight);
        this.adjustLeftSideBarTop()
        this.adjustRightSideBarTop()
        this.adjustLeftPaneHeight(window.scrollY)
        this.adjustRightPaneHeight(window.scrollY)
      });
    },
    setUpSize() {
      const leftSidebar = document.getElementById("left-side-bar");
      const rightSidebar = document.getElementById("right-side-bar");
      const headerPane = document.getElementById("header-pane");
      const leftPane = document.getElementById("left-pane");
      const rightPane = document.getElementById("right-pane");
      headerPane.style.height = this.headerPaneHeight + 'px';
      leftPane.style.paddingBottom = (this.leftPaneHeight + this.headerPaneHeight) + 'px'
      rightPane.style.paddingBottom = (this.rightPaneHeight + this.headerPaneHeight) + 'px'
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

@keyframes move-to-down {
  0% {
    transform: translateY(0px);
  }
  100% {
    transform: translateY(var(--move-to-y));
  }
}

@keyframes move-to-up {
  0% {
    transform: translateY(var(--move-to-y));
  }
  100% {
    transform: translateY(0px);
  }
}
</style>
