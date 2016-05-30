var myPerson = {
    name: 'Guybrush',
    age: 32,
    weapon: 'cutlass',
    address: {
        house_number: 7,
        street: "Larch Place",
        postcode: "PH2 7UW"
    },
    myFunc: function(text) {
        return "Hello " + text;
    }
};

var propertyName = "weapon";
// console.log(myPerson.weapon); // access the weapon property of the object
// console.log(myPerson[propertyName]); // same again but using a string


myPerson.pet = "parrot"; // creating a new property
myPerson.age += 20; // reasigning the value (in this case incrementing by 20)

// console.log(myPerson.address.street); // accessing an object within an object

// console.log(myPerson);
//

// console.log(myPerson.myFunc("test"));










var caesar = {
    city: "Rome"
};
var cleopatra = {
    city: "Alexandria"
};
var cincero = {
    city: "Rome"
};

var historyLesson = [caesar, cleopatra, cincero];

console.log(historyLesson[1]['city']);
