var LineChart = function() {
    var container = document.getElementById('linechart');
    var chart = new Highcharts.Chart({
        chart: {type: 'line', renderTo: container},
        title: {text: "Number of Pokemon I've Caught"},
        series: [
            {
                name: "Water",
                data: [2, 7, 12, 14],
                color: "aqua"
            },
            {
                name: "Fire",
                data: [7, 2, 30, 12],
                color: "red"
            },
            {
                name: "Grass",
                data: [1, 3, 1, 4],
                color: "lime"
            }
        ],
        xAxis: {
            categories: ["Jan", "Feb", "Mar", "Apr"]
        }
    });

};
