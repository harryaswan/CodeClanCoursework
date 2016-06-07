// var fs = require('fs');
//
//
// var buffer = fs.readFileSync("us-states.txt");
// var bufferString = buffer.toString();
//
// var newLineCount = bufferString.split("\n").length;
//
// console.log("There are " + newLineCount + " lines in the file!");


var fs = require('fs');

fs.readFile('us-states.txt', "utf-8", function(err, data) {
    if (err) {
        console.log("Uh Oh!", err);
    } else {
        var lines = data.split("\n");
        var newLineCount = lines.length;
        console.log("There are " + newLineCount + " lines in the file!");
        for (var l in lines) {
            console.log(lines[l]);
        }

    }
});

console.log("Stuff goes here");
