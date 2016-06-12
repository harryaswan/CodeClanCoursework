var MovieSearch = function(resElement, disElement) {
    this.resultElement = resElement;
    this.displayElement = disElement;
    this.grabData = function(apiUrl, callback){
        var url = "http://www.omdbapi.com/?" + apiUrl;
        var request = new XMLHttpRequest();
        request.open("GET", url);
        request.onload = function() {
            if (request.status === 200) {
                var jsonString = request.responseText;
                var result = JSON.parse(jsonString);
                callback(result);
            }
        }.bind(this);
        request.send(null);
    },
    this.search = function(e) {
        var url = "s=" + e.target.value;
        this.grabData(url, this.displaySearchResults);
    }.bind(this),
    this.displaySearchResults = function(data) {
        if (data.Response === "True") {
            var movies = data.Search;
            var div = document.createElement('div');
            for (var i = 0; i < movies.length; i++) {
                var span = document.createElement('div');
                span.setAttribute('imdb', movies[i].imdbID);
                span.onclick = function(e) {
                    var imdb = e.target.getAttribute('imdb');
                    if (!imdb) {
                        imdb = e.target.parentNode.getAttribute('imdb');
                    }
                    var url = "i=" + imdb + "&tomatoes=true";
                    this.grabData(url, this.displayMovie);
                }.bind(this);
                var img = document.createElement('img')
                img.setAttribute('src', movies[i].Poster);
                img.height = 40;
                span.innerText = movies[i].Title;
                span.insertBefore(img, span.childNodes[0]);
                div.appendChild(span);
            }
            this.resultElement.replaceChild(div, this.resultElement.firstChild);
        } else {
            var div = document.createElement('div');
            var p = document.createElement('p');
            p.innerText = "No results for your search...";
            div.appendChild(p);
            this.resultElement.replaceChild(div, this.resultElement.firstChild);
        }

    }.bind(this),
    this.displayMovie = function(data) {
        console.log(data);
        if (data.Response === "True") {
            var emptyDiv = document.createElement('div');
            this.resultElement.replaceChild(emptyDiv, this.resultElement.firstChild);
            var div = document.createElement('div');


            this.displayElement.replaceChild(div, this.displayElement.firstChild);
        } else {
            var div = document.createElement('div');
            var p = document.createElement('p');
            p.innerText = "Not a valid thingy";
            div.appendChild(p);
            this.displayElement.replaceChild(div, this.displayElement.firstChild);
        }
    }

}
