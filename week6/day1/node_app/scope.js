var name = "Keith";

var talk = function() {
    var name = "Harry";
    console.log("My name is " + name);
};
var walk = function() {
    console.log(name + " is walking");
};
// talk(); // My name is Harry
// walk(); // Keith is walking
// console.log("My name is " + name); // My name is Keith



var greet = function (isHappy) {
    var text = "";

    if (isHappy) {
        text = "Hello Friend!";
    } else {
        text = "Mind your own business";
    }

    var displayText = function() {
        console.log(text);
    };

    displayText();
};

greet(true);
