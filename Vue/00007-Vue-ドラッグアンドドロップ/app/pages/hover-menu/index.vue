<template>
  <div id="my-modal">
    <div id="my-modal-header">Click here to move</div>
    <p>Move</p>
    <p>this</p>
    <p>DIV</p>
  </div>
</template>

<script>
export default {
  mounted() {
    this.dragElement(document.getElementById("my-modal"));
  },
  methods: {
    dragElement(targetElement) {
      let moveX = 0,
        moveY = 0,
        prevClientX = 0,
        prevClientY = 0;
      if (document.getElementById(targetElement.id + "header")) {
        document.getElementById(
          targetElement.id + "header"
        ).onmousedown = dragStart;
      } else {
        targetElement.onmousedown = dragStart;
      }

      function dragStart(event) {
        console.log("dragStart");
        event = event || window.event;
        event.preventDefault();
        prevClientX = event.clientX;
        prevClientY = event.clientY;
        console.log("prevClientX,prevClientY", prevClientX, prevClientY);
        document.onmouseup = dragEnd;
        document.onmousemove = dragOver;
      }

      function dragOver(event) {
        console.log("dragOver");
        event = event || window.event;
        event.preventDefault();
        moveX = prevClientX - event.clientX;
        moveY = prevClientY - event.clientY;
        console.log("moveX,moveY", moveX, moveY);
        prevClientX = event.clientX;
        prevClientY = event.clientY;
        console.log("prevClientX,prevClientY", prevClientX, prevClientY);
        console.log(
          "offsetTop,offsetLeft",
          targetElement.offsetTop,
          targetElement.offsetLeft
        );
        targetElement.style.top = targetElement.offsetTop - moveY + "px";
        targetElement.style.left = targetElement.offsetLeft - moveX + "px";
      }

      function dragEnd() {
        console.log("dragEnd");
        document.onmouseup = null;
        document.onmousemove = null;
      }
    }
  }
};
</script>

<style>
#my-modal {
  position: absolute;
  z-index: 9;
  height: 200px;
  width: 200px;
  background-color: #eeeeee;
  text-align: center;
  border: 1px solid #d3d3d3;
  top: 0;
  right: 0;
}
#my-modal-header {
  padding: 10px;
  cursor: move;
  z-index: 10;
  background-color: #2196f3;
  color: #fff;
}
</style>
