// setTimeout(function() {
//     console.log("I waited 1 second...");
// }, 1000);


var logRed = function(message) {
    console.log(message);
};

var logNotRed = function() {
    console.log("It's NOT Red!");
};

var redChecker = function(message, colour, isRed, isNotRed) {
    if (colour === "red") {
        isRed(message);
    } else {
        isNotRed();
    }
};

redChecker("It's - red!", "red", logRed, logNotRed);
