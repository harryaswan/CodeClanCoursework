var BarChart = function(element, data, cats, title) {
    var container = element;
    var chart = new Highcharts.Chart({
        chart: {type: 'column', renderTo: container},
        title: {text: title},
        series: data,
        xAxis: {
            categories: cats
        }
    });

};
