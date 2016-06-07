var _ = require('lodash');
var testArray = [1,2,3,4,5,6,7,8,9,10];

var doubledArray = _.map(testArray, function(item) {
    return item * 2;
});

console.log(doubledArray);








//
// var loopFunc = function(number) {
//     console.log('the number is ' + number);
// };

// testArray.forEach(loopFunc);

//
// var forEach = function(arr, cb) {
//     for (var i = 0; i < arr.length; i++) {
//         cb(arr[i]);
//     }
//     // for (var a in arr) {
//     //     cb(arr[a]);
//     // }
// };
//
//
// forEach(testArray, loopFunc);
