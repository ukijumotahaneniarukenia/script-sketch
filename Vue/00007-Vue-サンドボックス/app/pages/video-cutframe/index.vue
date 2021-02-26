<template>
  <!-- https://stackoverflow.com/questions/32699721/javascript-extract-video-frames-reliably -->
  <div>
    <div>
      <input type="file" accept="video/*" @change="detectUploadFile($event)" />
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
      frameCutList: [],
      uploadFile: {},
    };
  },
  methods: {
    detectUploadFile(event) {
      const targetUploadFileList = Array.from(event.target.files);
      targetUploadFileList.map((item) => {
        this.uploadFile = item;
        this.extractFrames(this.uploadFile);
      });
    },
    extractFrames(targetFile) {
      let video = document.createElement("video");
      let array = [];
      let canvas = document.createElement("canvas");
      let ctx = canvas.getContext("2d");
      let pro = document.querySelector("#progress");

      function initCanvas(event) {
        console.log("initCanvas", event)
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
      }

      function drawFrame(event, targetVideoDom, targetCanvasDom, targetCanvasContext) {
        console.log("drawFrame", event)
        targetVideoDom.pause();
        targetCanvasContext.drawImage(targetVideoDom, 0, 0);
        // https://developer.mozilla.org/ja/docs/Web/API/HTMLCanvasElement/toBlob
        // https://developer.mozilla.org/en-US/docs/Web/API/HTMLCanvasElement/toBlob#Polyfill
        // これ便利 toData
        targetCanvasDom.toBlob((blob) => {console.log("blob",blob)}, "image/jpeg");
        pro.innerHTML =
          ((targetVideoDom.currentTime / targetVideoDom.duration) * 100).toFixed(2) + " %";
        if (targetVideoDom.currentTime < targetVideoDom.duration) {
          targetVideoDom.play();
        }
      }

      function saveFrame(blob) {
        array.push(blob);
      }

      function revokeURL(event) {
        URL.revokeObjectURL(this.src);
      }

      function onend(event) {
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

      video.addEventListener("loadedmetadata", (event)=>{
        initCanvas(event)
        // console.log(canvas)
        }
        , false
      );
      // クロージャじゃないとだめ
      // timeupdateイベント発火時にpause＆playする
      // https://developer.mozilla.org/ja/docs/Web/API/HTMLMediaElement/timeupdate_event
      video.addEventListener("timeupdate", (event) => {
        drawFrame(event, video, canvas, ctx)
        }, false
      );
      // video.addEventListener("ended", onend, false);

      video.src = URL.createObjectURL(targetFile);
      video.play();
    },
  },
};
</script>

<style>
</style>
