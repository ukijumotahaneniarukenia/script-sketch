<template>
  <div>
    <div class="all-slides">
      <h2 class="slides-title">Slides</h2>
      <div class="slide">Slide</div>
      <div class="slide">Slide</div>
      <div class="slide">Slide</div>
      <div class="slide">Slide</div>
      <div class="slide">Slide</div>
      <div class="slide">Slide</div>
      <div class="slide">Slide</div>
      <div class="slide">Slide</div>
      <div class="slide">Slide</div>
      <div class="slide">Slide</div>
    </div>
    <div class="cloned-slides" id="cloned-slides"></div>
  </div>
</template>

<script>
export default {
  mounted() {
    this.initilaize()
  },
  methods: {
    initilaize() {
      // Some of this code is me
      // Some of this code is this fiddle http://jsfiddle.net/dNfsJ/ thx to AJ for finding it for me.

      $(".slide").each(function(i) {
        var item = $(this);
        var item_clone = item.clone();
        item.data("clone", item_clone);
        var position = item.position();
        item_clone
          .css({
            left: position.left,
            top: position.top,
            visibility: "hidden"
          })
          .attr("data-pos", i + 1);

        $("#cloned-slides").append(item_clone);
      });

      $(".all-slides").sortable({
        axis: "y",
        revert: true,
        scroll: false,
        placeholder: "sortable-placeholder",
        cursor: "move",

        start: function(e, ui) {
          ui.helper.addClass("exclude-me");
          $(".all-slides .slide:not(.exclude-me)").css("visibility", "hidden");
          ui.helper.data("clone").hide();
          $(".cloned-slides .slide").css("visibility", "visible");
        },

        stop: function(e, ui) {
          $(".all-slides .slide.exclude-me").each(function() {
            var item = $(this);
            var clone = item.data("clone");
            var position = item.position();

            clone.css("left", position.left);
            clone.css("top", position.top);
            clone.show();

            item.removeClass("exclude-me");
          });

          $(".all-slides .slide").each(function() {
            var item = $(this);
            var clone = item.data("clone");

            clone.attr("data-pos", item.index());
          });

          $(".all-slides .slide").css("visibility", "visible");
          $(".cloned-slides .slide").css("visibility", "hidden");
        },

        change: function(e, ui) {
          $(".all-slides .slide:not(.exclude-me)").each(function() {
            var item = $(this);
            var clone = item.data("clone");
            clone.stop(true, false);
            var position = item.position();
            clone.animate(
              {
                left: position.left,
                top: position.top
              },
              200
            );
          });
        }
      });
    }
  }
};
</script>

<style>

.all-slides {
  background: #e3e7ed;
  counter-reset: slides;
  position: absolute;
  top: 0;
  left: 0;
  width: 150px;
  padding: 3rem 1rem 1rem 2rem;
  height: 100%;
  overflow: auto;
}

.slides-title {
  position: fixed;
  background: #e3e7ed;
  z-index: 8;
  width: 150px;
  text-align: center;
  top: 0;
  left: 0;
  margin: 0;
  border-bottom: 1px solid #cdd1d8;
  color: #8585a2;
  padding: 0.5rem 0.25rem;
  font-size: 1rem;
}

.slide {
  width: 100px;
  height: 60px;
  background: linear-gradient(#444, #111);
  position: relative;
  user-select: none;
  border: 1px solid white;
  margin: 0 0 0.75rem 0;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
  text-align: center;
  color: white;
  line-height: 60px;
  font-size: 0.5rem;
  z-index: 5;
}
.slide:before {
  position: absolute;
  bottom: 0;
  right: 100%;
  counter-increment: slides;
  content: counter(slides);
  padding-right: 0.35rem;
  color: #999;
  line-height: normal;
  font-size: 1rem;
}

.ui-sortable-helper {
  transition: none !important;
  animation: pulse 0.4s alternate infinite;
}

.sortable-placeholder {
  height: 60px;
  width: 5px;
  border-left: 2px solid #4999da;
  margin: 0 0 0.75rem 0;
  position: relative;
  z-index: 6;
}

@keyframes pulse {
  100% {
    transform: scale(1.1);
  }
}
.cloned-slides .slide {
  position: absolute;
  z-index: 1;
}
.cloned-slides .slide:before {
  content: attr(data-pos);
}
</style>
