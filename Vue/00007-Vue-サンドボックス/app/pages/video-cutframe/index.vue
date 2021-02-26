<template>
  <!-- https://stackoverflow.com/questions/32699721/javascript-extract-video-frames-reliably -->
  <div>
    <div>
      <input type="file" accept="video/*" />
      <p id="progress"></p>
    </div>
  </div>
</template>

<script>
// https://github.com/eligrey/FileSaver.js/
import { saveAs } from 'file-saver';

export default {

}
</script>

<style>

</style>
