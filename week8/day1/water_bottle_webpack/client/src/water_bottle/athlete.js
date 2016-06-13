var wBottle = require('./water_bottle');

var athlete = {
    bottle: wBottle,
    hydration: 100,
    distanceCovered: 0,
    run: function() {
        var runTimes;
        if (arguments.length > 0) {
            runTimes = arguments[0];
        } else {
            runTimes = 1;
        }
        for (var i = 0; i < runTimes; i++) {
            if (this.hydration >= 10) {
                this.hydration -= 10;
                this.distanceCovered += 10;
            }
        }
    },
    drink: function() {
        if (this.bottle.volume > 0) {
            this.hydration += this.bottle.drinkFrom();
        }
    }
};

athlete.bottle.fill();

module.exports = athlete;
