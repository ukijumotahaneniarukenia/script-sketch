<template>
  <v-container>
    <v-file-input
      accept="video/*"
      show-size
      label="File input"
      @change="handleFileSelect($event)"
    ></v-file-input>
    <v-layout v-if="uploadVideoFile !== ''" style="justify-content: center;">
      <video controls id="uploadVideoFile" src="" type="video/mp4"></video>
    </v-layout>
    <v-layout v-if="uploadVideoFile !== ''" style="justify-content: center;">
      <v-carousel id="upload-video-file-thumbnail-list">
        <v-carousel-item
          v-for="(item, i) in thumbnails"
          :key="i"
          :src="item.src"
          reverse-transition="fade-transition"
          transition="fade-transition"
        ></v-carousel-item>
      </v-carousel>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  data: () => ({
    uploadVideoFile: "",
    thumbnails: []
  }),
  methods: {
    readFile(targetFile, callBack) {
      const fileReader = new FileReader();
      fileReader.onload = callBack;
      fileReader.readAsDataURL(targetFile);
    },
    handleFileSelect(targetFile) {
      this.thumbnails = [];
      this.uploadVideoFile = "";

      this.uploadVideoFile = targetFile;

      this.readFile(targetFile, e => {
        console.log(targetFile)
        const targetDom = document.getElementById("uploadVideoFile");
        targetDom.src = URL.createObjectURL(targetFile);
        this.createThumbnails(targetDom.src);
      });
    },
    createThumbnails(targetDataUrl) {
      const video = document.createElement("video");
      const canvas = document.createElement("canvas");
      const context = canvas.getContext("2d");

      // キャンバスに枠組みを設定
      video.addEventListener("loadeddata", e => {
        console.log(e);
        console.log("loadeddata");
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        video.currentTime = 0;
      });

      // サムネイル画像を再生時間を均等に進めた地点でのスクリーンショットとしてこしらえる
      video.addEventListener("seeked", e => {
        console.log(e);
        console.log("seeked");
        if (video.currentTime < video.duration) {
          context.drawImage(video, 0, 0, video.videoWidth, video.videoHeight);
          this.thumbnails.push({ src: canvas.toDataURL("image/jpeg") });
          video.currentTime += Math.ceil(video.duration / 4); // 現在時刻を進める
        } else {
          context.drawImage(video, 0, 0, video.videoWidth, video.videoHeight);
          this.thumbnails.push({ src: canvas.toDataURL("image/jpeg") });
        }
      });

      // 再生コンテンツ動画URLを設定しロードイベントを明示的にキック
      video.src = targetDataUrl;
      video.load();
    }
  }
};
</script>

<style>
video {
  width: 80%;
}
#upload-video-file-thumbnail-list {
  margin-top: 10px;
  width: 80%;
  height: 300px !important;
}
</style>
