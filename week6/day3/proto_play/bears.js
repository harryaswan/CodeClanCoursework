var Bear = function(age, type, weight) {
    this.age = age;
    this.type = type;
    this.weight = weight;
};

Bear.prototype = {
    roar: function() {
        console.log("Rooar!");
    },
    eat: function(x) {
        this.weight += x;
    }
};

var bear = new Bear(2, "Brown", 5);

console.log(bear);
bear.roar();
bear.eat(5);
console.log(bear.weight);
