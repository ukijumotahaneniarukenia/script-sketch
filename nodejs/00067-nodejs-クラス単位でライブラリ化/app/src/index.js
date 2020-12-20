import { Canvas } from "../lib/canvas.js";

import { Square } from "../lib/square.js";
import { Circle } from "../lib/circle.js";
import { Triangle } from "../lib/triangle.js";

let circleBtn = document.querySelector(".circle");
let squareBtn = document.querySelector(".square");
let triangleBtn = document.querySelector(".triangle");

// create the canvas and reporting list
let myCanvas = new Canvas("myCanvas", document.body, 480, 320);
myCanvas.create();
myCanvas.createReportList();

// draw a square
let square1 = new Square(myCanvas.ctx, myCanvas.listId, 50, 50, 100, "blue");

squareBtn.addEventListener("click",()=>{
  square1.draw();
  square1.reportArea();
  square1.reportPerimeter();
})

// draw a circle
let circle1 = new Circle(myCanvas.ctx, myCanvas.listId, 75, 200, 100, "green");

circleBtn.addEventListener("click",()=>{
  circle1.draw();
  circle1.reportArea();
  circle1.reportPerimeter();
})


// draw a triangle
let triangle1 = new Triangle(
  myCanvas.ctx,
  myCanvas.listId,
  100,
  75,
  190,
  "yellow"
);

triangleBtn.addEventListener("click",()=>{
  triangle1.draw();
  triangle1.reportArea();
  triangle1.reportPerimeter();
})
