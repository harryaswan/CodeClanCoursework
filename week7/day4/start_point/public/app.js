
var main = function() {
    var pie = new PieChart([{name: "something", y: 3},{name: "something else", y: 2}], "Big Something", "hover text");
    var line = new LineChart();
    var bar = new BarChart();

    console.log(pie);
    console.log(line);
};

window.onload = main;
