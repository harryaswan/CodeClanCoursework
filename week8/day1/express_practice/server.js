var express = require('express');
var app = express();
var path = require('path');

var planets = [{
    name: "Mars",
    size: 2093
},
{
    name: "Saturn",
    size: 400000
},
{
    name: "Earth",
    size: 3500
}];

app.use(express.static('client/build'));

app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/client/build/index.html'));
});

app.get('/planets', function(req, res) {
    console.log(req.query);
    res.json(planets);

});


app.get('/planets/new', function(req, res) {
    res.send("This is the new route");
});


app.post('/planets', function(req, res) {
    console.log(req);
    res.send("This is the create route");
});

app.get('/planets/:id', function(req, res) {
    console.log(req);
    res.json(planets[req.params.id-1]);
});

app.get('/planets/:id/edit', function(req, res) {
    res.send("Edit route");
});

app.put('/planets/:id', function(req, res) {
    res.send("update route");
});

app.delete('/planets/:id', function(req, res) {
    res.send("Delete route");
});




app.listen('9000', function() {
    console.log("Party time");
});
