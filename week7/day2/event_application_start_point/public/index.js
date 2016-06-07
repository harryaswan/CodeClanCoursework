

var main = function() {

    var addBtn = document.getElementById('add-button');
    var clearBtn = document.getElementById('clear-button');
    var form = document.getElementById('film-form');
    addBtn.onclick = addFilm;
    form.onsubmit = addFilm;

    clearBtn.onclick = clearFilms;

    loadFilms();

};

var clearFilms = function() {
        localStorage.clear();
        var filmList = document.getElementById('film-list');
        filmList.innerHTML = null;
        document.getElementById('film-text-input').focus();
};

var loadFilms = function() {
    var films = getFilmArray();
    for (var i = 0; i < films.length; i++) {
        appendFilm(films[i]);
    }
};

var getFilmArray = function() {
    return JSON.parse(localStorage.getItem('films')) || [];
};

var getAddToFilmArray = function(item) {
    var films = getFilmArray();
    films.push(item);
    localStorage.setItem('films', JSON.stringify(films));
};

var addFilm = function(e) {
    // e.preventDefault(); <- this or return false at end stops form submitting
    var txt = document.getElementById('film-text-input');
    if (txt.value) {
        appendFilm(txt.value);
        getAddToFilmArray(txt.value);
        txt.value = null;
    }
    txt.focus();
    return false;
};

var appendFilm = function(filmName) {
    var filmList = document.getElementById('film-list');
    var filmItem = document.createElement('li');
    filmItem.innerText = filmName;
    filmList.appendChild(filmItem);
};

window.onload = main;
