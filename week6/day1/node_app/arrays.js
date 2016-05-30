var guitars = ["fender", "gibson", "gretsch"];
var drums = new Array();

drums.push("yamaha");
drums.push("gretsch");

drums[1] = "zildijan";
drums[100] = "test";

console.log("Guitars", guitars);
console.log("Drums", drums);

guitarsAndDrums = guitars.concat(drums);
console.log(guitarsAndDrums);

console.log(guitarsAndDrums.splice(0,1));
