var assert = require('chai').assert;
var bottle = require('../water_bottle');


describe('Bottle', function(){
    beforeEach(function() {
        bottle.empty();
    });
    it('Should be empty at start', function(){
        assert.equal(0, bottle.volume);
    });
    it('Should fill up to 100', function(){
        bottle.fill();
        assert.equal(100, bottle.volume);
    });
    it('Should empty down to 0', function(){
        bottle.empty();
        assert.equal(0, bottle.volume);
    });
    it('Should go down to 90 when drunk from', function(){
        bottle.fill();
        bottle.drinkFrom();
        assert.equal(90, bottle.volume);
    });
    it('Should not go below 0', function(){
        bottle.fill();
        for (var i=0; i<10; i++){
            bottle.drinkFrom();
        }
        assert.equal(0, bottle.volume);
    });
});
