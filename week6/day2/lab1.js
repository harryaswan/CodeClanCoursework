//Section 1

//what types are these? Write your answer in a comment beside it.

1;  // number
"cat"; // string
true; // boolean
[]; // array
{}; // object
1.1; // number
undefined; // undefined

//Section 2

// what is the truthy/falsiness values of the following
// write your answer in a comment beside it
// you can use an if to test this...
1; //true
"cat"; // true
true; // false
NaN; // false
[]; // true
{}; // true
undefined; // false
""; // false
0; // false


//Section 3

//Using examples that are different from above...

//3.1 Assign a variable that is a number
var number = 5;
//3.2 Assign a variable that is a string
var string = "look it's a string";
//3.3 Assign a variable that is a boolean
var boolean = false;
//3.4 Assign a variable that is an object
var object = {
    name: "Harry",
    age: 20
};

//Section 4
//4.1 Write a statement that writes "hello" to the console if it's true and "bye" if it is false

if (true) {
    console.log("hello");
} else {
    console.log("bye");
}

//Section 5
var animals = ["raccoon","hedgehog","mouse","gerbil"];

//5.1. Assign the first element to a variable
var firstElement = animals[1];
//5.2. Assign the last element to a variable
var lastElement = animals[(animals.length - 1)];
//5.3. Assign the length of an array to a variable
var arrayLength = animals.length;
//5.4. Add an item to the end of the array
animals.push("giraffe");
//5.5. Add an item to the start of the array
animals.unshift("Turtle");
//5.6. Assign the index of hedgehog to a variable
var hedgehogIndex = animals.index("hedgehog");

//Section 6

//6.1 Create an array of 5 vegetables
var veggies = ['carrots', 'potatoes', 'brocoli', 'peas', 'sweetcorn'];
//6.2 Loop over the array and write to the console using a "while"
var i = 0;
while (i < veggies.length) {
    console.log(veggies[i]);
    i++;
}
//6.3 Loop again using a "for" with a counter
for (var i = 0; i < veggies.length; i++) {
    console.log(veggies[i]);
}
//6.4 Loop again using a "for in"
for (var veg_i in veggies) {
    console.log(veggies[veg_i]);
}

//Section 7
var accounts = [
  { name: 'jay',
    amount: 125.50,
    type: 'personal'
  },
  { name: 'val',
    amount: 55125.10,
    type: 'business'
  },
  { name: 'marc',
    amount: 400.00,
    type: 'personal'
  },
  { name: 'keith',
    amount: 220.25,
    type: 'business'
  },
  { name: 'rick',
    amount: 1.00,
    type: 'personal'
  },
];
//7.1 Calculate the total cash in accounts
var totalCash = function() {
    var totalCashNumber = 0;
    for (var i = 0; i < accounts.length; i++) {
        totalCashNumber += accounts[i].amount;
    }
};

//7.2 Find the name of the account with the largest balance
var richestPerson = accounts[0];
for (var i = 1; i < accounts.length; i++) {
    if (accounts[i].amount > richestPerson.amount) {
        richestPerson = accounts[i];
    }
}
console.log(richestPerson.name);
//7.3 Find the name of the account with the smallest balance
var poorPerson = accounts[0];
for (var i = 1; i < accounts.length; i++) {
    if (accounts[i].amount < poorPerson.amount) {
        poorPerson = accounts[i];
    }
}
console.log(poorPerson.name);
//7.4 Calculate the average bank account value
console.log("Avg Cash:" + (totalCash()/accounts.length));
//7.5 Find the value of marcs bank account
for (var i = 0; i < accounts.length; i++) {
    if (accounts[i].name === "marc") {
        console.log("Marc has: " + accounts[i].amount);
    }
}
//7.6 Find the holder of the largest bank account
    // please look at 7.2
//7.7 Calculate the total cash in business accounts

//7.8 Find the largest personal account owner


//Section 8
//Assign a variable myPerson to a hash, giving them a name, height, favourite food and an eat method
