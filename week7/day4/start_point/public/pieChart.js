var PieChart = function(element, data, title, onHoverTitle) {
    var container = element;
    var chart = new Highcharts.Chart({
        chart: {type: 'pie', renderTo: container},
        title: {text: title},
        series: [
            {
                name: onHoverTitle,
                data: data ? data : []
            }
        ]
    });

};
