/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n\nconst DEFAULTS = {\n  DIM_X: 7,\n  DIM_Y: 8,\n  NUM_ASTEROIDS: 10\n};\n// const Asteroids = require('./asteroids.js');\n\n\n\nfunction Game() {\n\n}\n\nGame.prototype.randomPosition = function() {\n  const xCoord = Math.floor(Math.random() * Math.floor(695));\n  const yCoord = Math.floor(Math.random() * Math.floor(695));\n  return [xCoord, yCoord];\n};\n\nGame.prototype.addAsteroids = function() {\n  new Asteroid(options[pos] = randomPosition());\n};\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("console.log('webpack si working');\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nwindow.MovingObject = MovingObject;\n\n// document.getElementById('game-canvas')\n\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n  const canvasEl = document.getElementById(\"game-canvas\");\n  const ctx = canvasEl.getContext('2d');\n  canvasEl.width = 700;\n  canvasEl.height = 500;\n  const mi = new MovingObject({\n    pos: [30, 30],\n    vel: [100, 100],\n    radius: 10,\n    color: \"red\"\n  });\n  mi.draw(ctx);\n  \n  const my = new MovingObject({\n    pos: [150, 190],\n    vel: [10, 10],\n    radius: 100,\n    color: \"blue\"\n  });\n\n  my.draw(ctx);\n  mi.move(ctx);\n  mi.draw(ctx);\n  // my.move(ctx);\n  // my.draw(ctx);\n\n});\n\n// const ctx = canvasEl.getContext('2d');\n\n// window.ctx = ctx;\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nfunction MovingObject(options) {\n  const pos = options.pos;\n  const vel = options.vel;\n  const radius = options.radius;\n  const color = options.color;\n  this.pos = pos;\n  this.vel = vel;\n  this.radius = radius;\n  this.color = color;\n} \n\nMovingObject.prototype.move = function() {\n this.pos += [(this.pos[0] + this.vel[0]), (this.pos[1] + this.vel[1])];\n};\n\nMovingObject.prototype.draw = function(ctx) {\n//  ctx.radius = this.radius;\n this.centerX = this.pos[0];\n this.centerY = this.pos[1];\n ctx.fillStyle = this.color;\n ctx.beginPath();\n  ctx.arc(\n    this.centerX,\n    this.centerY,\n    this.radius,\n    0,\n    2 * Math.PI,\n    false\n  );\n  ctx.fill();\n};\n\nMovingObject.prototype.isCollidedWith = function(otherMovingObject) {\n \n};\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nconst Util = {\n  inherits(Child, Parent) {\n    const Surrogate = function () { };\n    Surrogate.prototype = Parent.prototype;\n    Child.prototype = new Surrogate();\n    Child.prototype.constructor = Child;\n  },\n  \n\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  },\n};\n\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });