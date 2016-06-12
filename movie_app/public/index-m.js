var main = function() {
    var movieMaster = new MovieSearch(document.getElementById('results'))
    document.getElementById("search_box").onkeyup = movieMaster.search;
};

window.onload = main;
