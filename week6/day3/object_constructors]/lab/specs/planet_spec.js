var assert = require('chai').assert;
var Planet = require('../planet');
var SolarSystem = require('../solar_system');

describe('Planet', function(){
    beforeEach(function() {
        planet = new Planet("Mars");
    });
    it('Should be able to create a planet with a name', function(){
        assert.equal("Mars", planet.name);
    });
});


describe('Solar System', function(){
    beforeEach(function() {
        system = new SolarSystem("Colin's System");
    });
    it('Should have a name and empty planet array', function(){
        assert.equal("Colin's System", system.name);
        assert.equal(0, system.planets.length);
    });
    it('Should be able to add a planet to the array', function(){
        system.addPlanet(new Planet("Mars"));
        assert.equal(1, system.planets.length);
    });
    it('Should be able to add multiple planets and check array is correct', function(){
        var mars = new Planet("Mars");
        var earth = new Planet("Earth");
        var jupiter = new Planet("Jupiter");
        system.addPlanet(mars);
        system.addPlanet(earth);
        system.addPlanet(jupiter);
        assert.equal(3, system.planets.length);
        assert.deepEqual([mars, earth, jupiter], system.planets);
    });
    it('Should be able to reomve a planet and check array is correct', function(){
        var mars = new Planet("Mars");
        var earth = new Planet("Earth");
        var jupiter = new Planet("Jupiter");
        system.addPlanet(mars);
        system.addPlanet(earth);
        system.addPlanet(jupiter);
        system.removePlanet(earth);
        assert.equal(2, system.planets.length);
        assert.deepEqual([mars, jupiter], system.planets);
    });
});
