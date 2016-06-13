/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	var waterBottle = __webpack_require__(1);
	waterBottle.fill();


	var displayVolume = function() {
	    var volDisplay = document.getElementById('volume');
	    volDisplay.innerText = waterBottle.volume;
	};

	window.onload = function() {

	    console.log("Started...");

	    console.log(waterBottle);
	    displayVolume();

	    document.getElementById('drink').onclick = function() {
	        waterBottle.drinkFrom();
	        displayVolume();
	    };

	    document.getElementById('refill').onclick = function() {
	        waterBottle.fill();
	        displayVolume();
	    };

	};


/***/ },
/* 1 */
/***/ function(module, exports) {

	var bottle = {
	    volume: 0,
	    fill: function() {
	        this.volume = 100;
	    },
	    empty: function() {
	        this.volume = 0;
	    },
	    drinkFrom: function() {
	        this.volume -= 10;
	        if (this.volume < 0) {
	            this.volume = 0;
	        }
	        return 10;
	    }
	};
	module.exports = bottle;


/***/ }
/******/ ]);