```
$ curl -s https://httpbin.org/json | jq
{
  "slideshow": {
    "author": "Yours Truly",
    "date": "date of publication",
    "slides": [
      {
        "title": "Wake up to WonderWidgets!",
        "type": "all"
      },
      {
        "items": [
          "Why <em>WonderWidgets</em> are great",
          "Who <em>buys</em> WonderWidgets"
        ],
        "title": "Overview",
        "type": "all"
      }
    ],
    "title": "Sample Slide Show"
  }
}

$ curl -s https://httpbin.org/json | gron
json = {};
json.slideshow = {};
json.slideshow.author = "Yours Truly";
json.slideshow.date = "date of publication";
json.slideshow.slides = [];
json.slideshow.slides[0] = {};
json.slideshow.slides[0].title = "Wake up to WonderWidgets!";
json.slideshow.slides[0].type = "all";
json.slideshow.slides[1] = {};
json.slideshow.slides[1].items = [];
json.slideshow.slides[1].items[0] = "Why <em>WonderWidgets</em> are great";
json.slideshow.slides[1].items[1] = "Who <em>buys</em> WonderWidgets";
json.slideshow.slides[1].title = "Overview";
json.slideshow.slides[1].type = "all";
json.slideshow.title = "Sample Slide Show";

$ curl -s https://httpbin.org/json | gron | grep all | gron --ungron | jq
{
  "slideshow": {
    "slides": [
      {
        "type": "all"
      },
      {
        "type": "all"
      }
    ]
  }
}
```
