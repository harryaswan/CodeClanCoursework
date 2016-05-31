
var pets = ['dog', 'cat', 'pika'];

// for in loop - pet in this example is the index of the array - is the key
for (var pet in pets) {
    // console.log(pet);
    // console.log(pets[pet]);
}


// for of loop - new in ES6 - might not work in all browsers
for (pet of pets) {
    // console.log(pet);
}

// standard for loop
for (var i = 0; i < pets.length; i++) {
    // console.log("i: " + pets[i]);
}


// for in loop over a object
var obj = {
    student1: 3,
    student2: 12,
    student3: 40
};

for (var key in obj) {
    console.log(obj[key]);
}


var x = 0;
while(x<10) {
    console.log("Loop " + x);
    x += 2;
}
