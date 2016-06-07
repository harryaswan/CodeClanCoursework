var wisePerson = {
    wisdom: function() {
        console.log("Commit often");
    }
};

var myPerson = Object.create(wisePerson);

myPerson.walk = function() {
    console.log("I am walking");
};

// myPerson.wisdom();

var Fish = function(name, colour) {
    this.name = name;
    this.colour = colour;

};

Fish.prototype = { // we do this so that there is only 1 instance of the method regardless of the number of objects that exist
    swim: function() {
        console.log("swimming");
    }
};

var nemo = new Fish('nemo', 'orange');
newmo.swim();
