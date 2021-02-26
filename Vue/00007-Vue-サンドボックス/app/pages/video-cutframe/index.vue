<template>
  <!-- https://stackoverflow.com/questions/32699721/javascript-extract-video-frames-reliably -->
  <div>
    <div>
      <input type="file" accept="video/*" @change="detectUploadFile($event)"/>
      <p id="progress"></p>
    </div>
  </div>
</template>

<script>
// https://github.com/eligrey/FileSaver.js/
import { saveAs } from "file-saver";

export default {
  data() {
    return {
      uploadFile: {}
    }
  },
  methods: {
    detectUploadFile(event) {
      const targetUploadFileList = Array.from(event.target.files)
      targetUploadFileList.map(item => {
        this.uploadFile = item
        this.setUpVideo(this.uploadFile)
      })
    },
    setUpCanvas(targetVideoDom) {
      let canvas = document.createElement("canvas");
      canvas.width = targetVideoDom.videoWidth;
      canvas.height = targetVideoDom.videoHeight;
      console.log("setUpCanvas", targetVideoDom, canvas)
    },
    setUpVideo(targetFile) {
      let video = document.createElement("video");
      video.muted = true;
      video.src = URL.createObjectURL(targetFile);
      video.play();
      // ビデオタグのsrc属性が変更されると、loadedmetadataイベントが発火する
      video.addEventListener("loadedmetadata", (event)=>{
        console.log("loadedmetadata",event)
        this.setUpCanvas(video)
      }, false);
      // ビデオを再生すると timeupdateイベントが複数回発火し
      video.addEventListener("timeupdate", (event)=>{console.log("timeupdate",event)}, false);
      video.addEventListener("ended", (event)=>{console.log("ended",event)}, false);
    },
    extractFrames() {
      let video = document.createElement("video");
      let array = [];
      let canvas = document.createElement("canvas");
      let ctx = canvas.getContext("2d");
      let pro = document.querySelector("#progress");

      function initCanvas(e) {
        canvas.width = this.videoWidth;
        canvas.height = this.videoHeight;
      }

      function drawFrame(e) {
        this.pause();
        ctx.drawImage(this, 0, 0);
        /* 
    this will save as a Blob, less memory consumptive than toDataURL
    a polyfill can be found at
    https://developer.mozilla.org/en-US/docs/Web/API/HTMLCanvasElement/toBlob#Polyfill
    */
        canvas.toBlob(saveFrame, "image/jpeg");
        pro.innerHTML =
          ((this.currentTime / this.duration) * 100).toFixed(2) + " %";
        if (this.currentTime < this.duration) {
          this.play();
        }
      }

      function saveFrame(blob) {
        array.push(blob);
      }

      function revokeURL(e) {
        URL.revokeObjectURL(this.src);
      }

      function onend(e) {
        let img;
        // do whatever with the frames
        for (let i = 0; i < array.length; i++) {
          img = new Image();
          img.onload = revokeURL;
          img.src = URL.createObjectURL(array[i]);
          document.body.appendChild(img);
        }
        // we don't need the video's objectURL anymore
        URL.revokeObjectURL(this.src);
      }

      video.muted = true;

      video.addEventListener("loadedmetadata", initCanvas, false);
      video.addEventListener("timeupdate", drawFrame, false);
      video.addEventListener("ended", onend, false);

      video.src = URL.createObjectURL(this.files[0]);
      video.play();
    },
  },
};
</script>

<style>
</style>
