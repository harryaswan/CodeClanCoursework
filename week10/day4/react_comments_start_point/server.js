var express = require('express');
var app = express();
var path = require('path');
var MongoDB = require('mongodb').MongoClient;
var mongoURL = "mongodb://localhost:27017/comment_application";
var bodyParser = require('body-parser');

app.use(bodyParser.json());
// app.use(bodyParser.urlencoded({extended:true}));

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname + '/client/build/index.html'));
});

app.get('/api/comments', function(req, res) {
    MongoDB.connect(mongoURL, function(err, db) {
        var collection = db.collection('comments');
        collection.find({}).toArray(function(err, docs) {
            res.json(docs);
            db.close();
        });
    });
});


app.post('/api/comments', function(req, res) {
    var newComment = req.body;
    MongoDB.connect(mongoURL, function(err, db) {
        var collection = db.collection('comments');
        collection.insert(newComment);
        db.close();
    });
    res.status(200).end();
});

app.delete('/api/comments', function(req, res) {
    var commentid = req.body;
    console.log(commentid);
    MongoDB.connect(mongoURL, function(err, db) {
        var collection = db.collection('comments');
        collection.remove(commentid);
        db.close();
    });
    res.status(200).end();
})

app.use(express.static('client/build'));


var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
