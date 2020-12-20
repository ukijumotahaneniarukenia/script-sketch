#!/usr/bin/env node
/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is not neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./lib/canvas.js":
/*!***********************!*\
  !*** ./lib/canvas.js ***!
  \***********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"create\": () => /* binding */ create,\n/* harmony export */   \"createReportList\": () => /* binding */ createReportList\n/* harmony export */ });\nfunction create(id, parent, width, height) {\n  let divWrapper = document.createElement(\"div\");\n  let canvasElem = document.createElement(\"canvas\");\n  parent.appendChild(divWrapper);\n  divWrapper.appendChild(canvasElem);\n\n  divWrapper.id = id;\n  canvasElem.width = width;\n  canvasElem.height = height;\n\n  let ctx = canvasElem.getContext(\"2d\");\n\n  return {\n    ctx: ctx,\n    id: id,\n  };\n}\n\nfunction createReportList(wrapperId) {\n  let list = document.createElement(\"ul\");\n  list.id = wrapperId + \"-reporter\";\n\n  let canvasWrapper = document.getElementById(wrapperId);\n  canvasWrapper.appendChild(list);\n\n  return list.id;\n}\n\n\n\n\n//# sourceURL=webpack://app/./lib/canvas.js?");

/***/ }),

/***/ "./lib/square.js":
/*!***********************!*\
  !*** ./lib/square.js ***!
  \***********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"name\": () => /* binding */ name,\n/* harmony export */   \"draw\": () => /* binding */ draw,\n/* harmony export */   \"reportArea\": () => /* binding */ reportArea,\n/* harmony export */   \"reportPerimeter\": () => /* binding */ reportPerimeter,\n/* harmony export */   \"default\": () => __WEBPACK_DEFAULT_EXPORT__\n/* harmony export */ });\nconst name = \"square\";\n\nfunction draw(ctx, length, x, y, color) {\n  ctx.fillStyle = color;\n  ctx.fillRect(x, y, length, length);\n\n  return {\n    length: length,\n    x: x,\n    y: y,\n    color: color,\n  };\n}\n\nfunction random(min, max) {\n  let num = Math.floor(Math.random() * (max - min)) + min;\n  return num;\n}\n\nfunction reportArea(length, listId) {\n  let listItem = document.createElement(\"li\");\n  listItem.textContent = `${name} area is ${length * length}px squared.`;\n\n  let list = document.getElementById(listId);\n  list.appendChild(listItem);\n}\n\nfunction reportPerimeter(length, listId) {\n  let listItem = document.createElement(\"li\");\n  listItem.textContent = `${name} perimeter is ${length * 4}px.`;\n\n  let list = document.getElementById(listId);\n  list.appendChild(listItem);\n}\n\nfunction randomSquare(ctx) {\n  let color1 = random(0, 255);\n  let color2 = random(0, 255);\n  let color3 = random(0, 255);\n  let color = `rgb(${color1},${color2},${color3})`;\n  ctx.fillStyle = color;\n\n  let x = random(0, 480);\n  let y = random(0, 320);\n  let length = random(10, 100);\n  ctx.fillRect(x, y, length, length);\n\n  return {\n    length: length,\n    x: x,\n    y: y,\n    color: color,\n  };\n}\n\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (randomSquare);\n\n\n//# sourceURL=webpack://app/./lib/square.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _lib_canvas_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../lib/canvas.js */ \"./lib/canvas.js\");\n/* harmony import */ var _lib_square_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../lib/square.js */ \"./lib/square.js\");\n\n\n\n\nlet myCanvas = (0,_lib_canvas_js__WEBPACK_IMPORTED_MODULE_0__.create)(\"myCanvas\", document.body, 480, 320);\nlet reportList = (0,_lib_canvas_js__WEBPACK_IMPORTED_MODULE_0__.createReportList)(myCanvas.id);\n\nlet square1 = (0,_lib_square_js__WEBPACK_IMPORTED_MODULE_1__.draw)(myCanvas.ctx, 50, 50, 100, \"blue\");\n(0,_lib_square_js__WEBPACK_IMPORTED_MODULE_1__.reportArea)(square1.length, reportList);\n(0,_lib_square_js__WEBPACK_IMPORTED_MODULE_1__.reportPerimeter)(square1.length, reportList);\n\n// Use the default\nlet square2 = (0,_lib_square_js__WEBPACK_IMPORTED_MODULE_1__.default)(myCanvas.ctx);\n\n\n//# sourceURL=webpack://app/./src/index.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => Object.prototype.hasOwnProperty.call(obj, prop)
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	// startup
/******/ 	// Load entry module
/******/ 	__webpack_require__("./src/index.js");
/******/ 	// This entry module used 'exports' so it can't be inlined
/******/ })()
;