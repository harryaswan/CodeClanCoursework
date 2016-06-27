var express = require('express');
var app = express();
var path = require('path');
var MongoClient = require('mongodb').MongoClient;
var bodyParser = require('body-parser');
var url = "mongodb://localhost:27017/bank";

// app.use(bodyParser.json());
var concat = require('concat-stream');
app.use(function(req, res, next){
  req.pipe(concat(function(data){
      console.log(data);
    req.body = data;
    next();
  }));
  console.log(req);
});

app.get('/accounts', function (req, res) {
    MongoClient.connect(url, function(err, db) {
        var collection = db.collection('accounts');
        collection.find({}).toArray(function(err, docs) {
            res.json(docs);
            db.close();
        });
    });
});

app.post('/accounts', function(req, res) {
    MongoClient.connect(url, function(err, db) {
        var collection = db.collection('accounts');
        collection.insert(req.body);
    });
    res.status(200).end();
});

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname + '/client/build/index.html'));
});

app.use(express.static('client/build'));


var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
