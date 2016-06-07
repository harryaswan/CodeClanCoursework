

var letsGo = function() {

    var btn = document.getElementById('add-button');
    var form = document.getElementById('film-form');
    btn.onclick = addFilm;
    form.onsubmit = addFilm;



};

var addFilm = function(e) {
    // e.preventDefault(); <- this or return false at end stops form submitting
    var txt = document.getElementById('film-text-input');
    if (txt.value) {
        appendFilm(txt.value);
        txt.value = null;
    }
    txt.focus();
    return false;
};

var appendFilm = function(filmName) {
    console.log(arguments.callee);
    var filmList = document.getElementById('film-list');
    var filmItem = document.createElement('li');
    filmItem.innerText = filmName;
    filmList.appendChild(filmItem);
};

window.onload = letsGo;
