var House = function(sqFeet, bathrooms, bedrooms) {
    this.sqFeet = sqFeet;
    this.bathrooms = bathrooms;
    this.bedrooms = bedrooms;
    this.numberOfRooms = function() {
        return this.bathrooms + this.bedrooms;
    };
};

var house1 = new House(1000, 3, 4);
var house2 = new House(2300, 4, 5);
console.log(house1.numberOfRooms());
console.log(house2);
console.log(house1 instanceof House);
