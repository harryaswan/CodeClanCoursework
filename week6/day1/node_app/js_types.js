// NUMBERS
var a = 1;
var b = 2;
var c = 2.5;
// console.log(a+b-c);

// STRINGS
var myString = "What a lovely day"
// console.log(myString.toUpperCase());

// BOOLEANS

// console.log(1 > 2);
// console.log(2 == 2);
//
// //3*= checks the TYPE of object not just the value
// console.log(2 == "2"); // this will return true
// console.log(2 === "2"); // this will return false

// NULL & UNDEFINED
// var myOtherBear = null;
// console.log(myOtherBear);
//
// var myExtraBear;
// console.log(myExtraBear);
//
// console.log(typeof(1)); // number


// var number = 1;
// number += "lolz";
//
// console.log(number);
// console.log("route" + 6 + 6); // => route66
// console.log("route" + (6 + 6)); // => route12 (BRACKETS)
// console.log(6 + 6 + "route"); // => 12route

// BOOLEAN OPERATORS

// && - and
// || - or
// == - equals of values
// === - equals with object type as well
// ! - negates a boolean value

// Falsiness - the following is always false in and IF statement
// ---------
//  false
//  0
//  undefined
//  Empty String
//  Null
//  NaN


var a = true;

if (a) console.log("true a");
if (!a) console.log("false a");

var bad = NaN;
if (bad) console.log("true bad");
