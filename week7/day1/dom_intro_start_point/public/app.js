// this = window at this level

window.onload = function() {
    main();
};

var main = function() {
    var element = document.getElementById('main_text');
    logElement(element);
};

var logElement = function (element) {
    console.log(element);
};
