window.onload = function() {
    main();
};

var main = function() {

    var qForm = document.querySelector('#addQuoteForm');
    var qBtn = document.querySelector('#quoteAdd');
    var qText = document.querySelector('#quoteText');
    var qAuthor = document.querySelector('#quoteAuthor');

    qText.oninput = alterLastQuoteText;
    qAuthor.oninput = alterLastQuoteAuthor;

    qText.onfocus = function(e) {
        var lastQuote = document.querySelector('#quotes').lastChild.getElementsByTagName('blockquote')[0].childNodes[0].nodeValue;
        if (lastQuote != "Start Typing") {
            qText.value = lastQuote;
        }
    };

    qAuthor.onfocus = function(e) {
        var lastAuthor = document.querySelector('#quotes').lastChild.getElementsByTagName('blockquote')[0].childNodes[1].innerText;
        if (lastAuthor != " - Me") {
            qAuthor.value = lastAuthor.substring(3);
        }
    };
    qForm.onsubmit = function() {
        checkLastQuote();
        createQuote("Start Typing", "Me");
        // qText.value = null;
        // qAuthor.value = null;
        resetForm();
        qText.focus();
        return false;
    };



    // qBtn.onclick = function() {
    //     createQuote("Start Typing", "Me");
    // };

    loadOldQuotes();

    createQuote("Start Typing", "Me");

    addBtnListeners();

};

// function addBtnListeners () {
//     var elements = document.querySelectorAll('.delete');
//     console.log(elements);
//     for(var i = 0; i < elements.length; i++) {
//         if (elements[i].onclick === null) {
//             elements[i].onclick = deleteQuote;
//         }
//     }
// }

function deleteQuote (e) {
    var that = e.target.parentNode.parentNode;
    that.parentNode.removeChild(that);
}

function loadOldQuotes() {
    for (var i = 0; i < predefinedQuotes.length; i++) {
        createQuote(predefinedQuotes[i].quote, predefinedQuotes[i].author);
    }
}

function checkLastQuote() {
    var quote = document.querySelector('#quotes').lastChild.getElementsByTagName('blockquote')[0].childNodes[0];
    var author = document.querySelector('#quotes').lastChild.getElementsByTagName('blockquote')[0].childNodes[1];

    if (quote.nodeValue === "Start Typing") {
        quote.nodeValue = "There was once an giant rabbit....";
    }
    if (author.innerText === " - Me") {
        author.innerText = " - Nobody, ever!";
    }

}

function alterLastQuoteText(e) {
    var txt = e.target;

    var quote = document.querySelector('#quotes').lastChild.getElementsByTagName('blockquote')[0].childNodes[0];
    quote.nodeValue = txt.value;
}


function alterLastQuoteAuthor(e) {
    var txt = e.target;
    var author = document.querySelector('#quotes').lastChild.getElementsByTagName('blockquote')[0].childNodes[1];
    author.innerText = " - " + txt.value;
}

function createQuote(quote, author) {
    var quoteArticle = document.createElement('article');
    quoteArticle.classList.add('quote');

    var blockQuote = document.createElement('blockquote');
    blockQuote.innerText = quote;

    var cite = document.createElement('cite');
    cite.innerText = " - " + author;

    var delBtn = document.createElement('input');
    delBtn.setAttribute('type', 'button');
    delBtn.setAttribute('class', 'delete');
    delBtn.setAttribute('value', 'DELETE');
    delBtn.onclick = deleteQuote;


    blockQuote.appendChild(cite);
    blockQuote.appendChild(delBtn);
    quoteArticle.appendChild(blockQuote);

    var quotes = document.querySelector("#quotes");

    // quotes.insertBefore(quoteArticle, quotes.firstChild);
    quotes.appendChild(quoteArticle);
}











var predefinedQuotes = [
        {quote: "What a great day!", author: "Frank"},
        {quote: "Ignore frank, it's raining...", author: "Colin"},
        {quote: "I like carrots.", author: "Vincent"},
        {quote: "Oh Vinnie!", author: "Frank & Colin"}
];
