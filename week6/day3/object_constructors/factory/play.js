var Animal = function(name, address) {
    return {
        name: name,
        address: address
    };
};

var Rabbit = function(address) {
    var rabbit = Animal("Rabbit", address);

    rabbit.hasHat = true;
    rabbit.bounce = function() {
        return "Bouncy";
    };
    return rabbit;
};

var myRabbit = Rabbit("The Burrows");
var animal2 = Animal("Horse", "The Field");

console.log(myRabbit);
console.log(myRabbit.bounce());
console.log(animal2);
