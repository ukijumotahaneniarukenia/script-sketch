<template>
  <div id="main-page">
    <div id="header-pane">
      <b-button
        label="openLeftSidebar"
        type="is-info"
        icon-left="check"
        @click="openLeftSidebar"
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
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      leftSideBarWidth: 300,
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
    adjustLeftPaneHeight() {
      const leftPane = document.getElementById("left-pane");
      leftPane.style.height = window.document.body.scrollHeight + 'px';
      leftPane.style.paddingBottom = window.document.body.scrollHeight + 'px'
    },
    adjustRightPaneHeight() {
      const rightPane = document.getElementById("right-pane");
      rightPane.style.height = window.document.body.scrollHeight + 'px';
      rightPane.style.paddingBottom = window.document.body.scrollHeight + 'px'
    },
    closeLeftSidebar() {
      console.log("closeLeftSidebar");
      const targetDom = document.getElementById("left-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("left-side-bar-close");
      // targetDom.style.setProperty("--move-to-x", this.leftSideBarWidth);
      console.log(window.getComputedStyle(targetDom).getPropertyValue("--move-to-x"));
    },
    openLeftSidebar() {
      console.log("openLeftSidebar");
      const targetDom = document.getElementById("left-side-bar");
      targetDom.classList = ''
      targetDom.classList.add("left-side-bar-open");
      // targetDom.style.setProperty("--move-to-x", this.leftSideBarWidth);
      console.log(window.getComputedStyle(targetDom).getPropertyValue("--move-to-x"));
    },
    detectWindowScroll() {
      window.addEventListener("scroll", event => {
        console.log(event);
        console.log(window.scrollY);
        console.log(window.innerWidth);
        console.log(window.innerHeight);
        console.log(window.document.body.scrollHeight);
        this.adjustLeftSideBarTop()
        this.adjustLeftPaneHeight()
        this.adjustRightPaneHeight()
      });
    },
    setUpSize() {
      const leftSidebar = document.getElementById("left-side-bar");
      const headerPane = document.getElementById("header-pane");
      const leftPane = document.getElementById("left-pane");
      const rightPane = document.getElementById("right-pane");
      headerPane.style.height = this.headerPaneHeight + 'px';
      leftPane.style.paddingBottom = (this.leftPaneHeight + this.headerPaneHeight) + 'px'
      rightPane.style.paddingBottom = (this.rightPaneHeight + this.headerPaneHeight) + 'px'
      leftSidebar.style.left = -this.leftSideBarWidth + "px";
      leftSidebar.style.width = this.leftSideBarWidth + "px";
      leftSidebar.style.height = window.document.body.scrollHeight + "px"; // ここをいい感じにしたい
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
  left: 0px;
  background-color: #f3e886;
}

.left-side-bar-open {
  --move-to-x: 300px;
  animation: 0.5s move-to-right forwards;
}

.left-side-bar-close {
  --move-to-x: 300px;
  animation: 0.5s move-to-left forwards;
}

@keyframes move-to-right {
  0% {
    transform: translateX(0px);
  }
  100% {
    transform: translateX(var(--move-to-x));
  }
}

@keyframes move-to-left {
  0% {
    transform: translateX(var(--move-to-x));
  }
  100% {
    transform: translateX(0px);
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
