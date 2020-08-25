```
$ echo '#header' | emmet
<div id="header"></div>

$ echo '#header' | emmet | jq -Rr '[splits("(?<=\\W)")|splits("\\w+\\K")|select(""!=.)]'
[
  "<",
  "div",
  " ",
  "id",
  "=",
  "\"",
  "header",
  "\"",
  ">",
  "<",
  "/",
  "div",
  ">"
]

$ echo '#header' | emmet | jq -Rr '[splits("(?<=\\W)")|splits("\\w+\\K")|select(""!=.)]|join("")'
<div id="header"></div>


$ echo '.title' | emmet
<div class="title"></div>

$ echo '.title' | emmet | jq -Rr '[splits("(?<=\\W)")|splits("\\w+\\K")|select(""!=.)]'
[
  "<",
  "div",
  " ",
  "class",
  "=",
  "\"",
  "title",
  "\"",
  ">",
  "<",
  "/",
  "div",
  ">"
]

$ echo '.title' | emmet | jq -Rr '[splits("(?<=\\W)")|splits("\\w+\\K")|select(""!=.)]|join("")'
<div class="title"></div>



$ echo 'form#search.wide' | emmet
<form action="" id="search" class="wide"></form>


$ echo 'form#search.wide' | emmet | jq -Rr '[splits("(?<=\\W)")|splits("\\w+\\K")|select(""!=.)]'
[
  "<",
  "form",
  " ",
  "action",
  "=",
  "\"",
  "\"",
  " ",
  "id",
  "=",
  "\"",
  "search",
  "\"",
  " ",
  "class",
  "=",
  "\"",
  "wide",
  "\"",
  ">",
  "<",
  "/",
  "form",
  ">"
]

$ echo 'form#search.wide' | emmet | jq -Rr '[splits("(?<=\\W)")|splits("\\w+\\K")|select(""!=.)]|join("")'
<form action="" id="search" class="wide"></form>


$ echo 'p.class1.class2.class3' | emmet
<p class="class1 class2 class3"></p>


$ echo 'p.class1.class2.class3' | emmet | jq -Rr '[splits("(?<=\\W)")|splits("\\w+\\K")|select(""!=.)]'
[
  "<",
  "p",
  " ",
  "class",
  "=",
  "\"",
  "class1",
  " ",
  "class2",
  " ",
  "class3",
  "\"",
  ">",
  "<",
  "/",
  "p",
  ">"
]

$ echo 'p.class1.class2.class3' | emmet | jq -Rr '[splits("(?<=\\W)")|splits("\\w+\\K")|select(""!=.)]|join("")'
<p class="class1 class2 class3"></p>
```
