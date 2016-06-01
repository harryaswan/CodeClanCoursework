var SolarSystem = function(name) {
    this.name = name;
    this.planets = [];
    this.addPlanet = function(planet) {
        this.planets.push(planet);
    };
    this.removePlanet = function(planet) {
        var i = this.planets.indexOf(planet);
        this.planets.splice(i, 1);
    };
};

module.exports = SolarSystem;
