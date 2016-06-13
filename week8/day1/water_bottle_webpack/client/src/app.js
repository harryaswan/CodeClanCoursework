var waterBottle = require("./water_bottle/water_bottle.js");
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
