
var main = function() {
    loadData();
};

var populatePieChart = function(data) {
    var element = document.getElementById('populations1');
    var dataArray = [];
    for (var i = 0; i < data.length; i++) {
        dataArray.push({name: data[i].name, y: data[i].population});
    }
    var pie = new PieChart(element, dataArray, "Population in Every Country in the World", "Population");
};

var populateBarChart = function(data) {
    var element = document.getElementById('populations2');
    var dataArray = [{
        name: "Areas",
        data: []
    }];
    var catArray = [];
    for (var i = 0; i < 5; i++) {
        var rnd = Math.floor(Math.random() * data.length);
        dataArray[0].data.push(data[rnd].area);
        catArray.push(data[rnd].name);
    }
    console.log(dataArray);
    console.log(catArray);
    var pie = new BarChart(element, dataArray, catArray, "Area of 5 Random Countries");
};

var loadData = function() {
    var url = "https://restcountries.eu/rest/v1";
    var request = new XMLHttpRequest();
    request.open("GET", url);
    request.onload = function() {
        if (request.status === 200) {
            var jsonString = request.responseText;
            localStorage.setItem('data', jsonString);
            countryData = JSON.parse(jsonString);
            populatePieChart(countryData);
            populateBarChart(countryData);
        }
    };
    request.send(null);
};

window.onload = main;
