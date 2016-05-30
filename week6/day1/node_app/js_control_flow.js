var myName = "Harry";

if (myName === "Harry") {
    console.log("Hey Harry!")
}


var counter = 1;

if (counter > 0) {
    console.log("The counter is > 0");
} else if (counter < 0) {
    console.log("The counter is < 0");
} else {
    console.log("The counter is 0");
}


var pet = "dog";
switch (pet) {
    case "dog":
        console.log("Dogs go woof");
        break;
    case "cat":
        console.log("Cats go meow");
        break;
    default:
        console.log("Some other noise is made");
}



1+1===2 ? console.log("woop go maths") : console.log("Nope, maths is dead");
