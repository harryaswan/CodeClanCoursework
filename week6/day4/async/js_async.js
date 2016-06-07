// console.log("Customer 1: Can I order a latte please?");
//
// console.log("Server: I'll had it off to the barista");
//
// setTimeout(function() {
//     console.log("Your latte is ready customer 1");
// }, 4000);
//
// console.log("Customer 2: Can I order a expresso please?");
//
// console.log("Server: I'll had it off to the barista");
//
// setTimeout(function() {
//     console.log("Your expresso is ready customer 2");
// }, 2000);


function getTweetsAsync(callback) {
    //go and get the tweets
    setTimeout(function() {
        var tweets = "These are the tweets you are looking for";
        callback(tweets);
    }, 2000);
}

var myTweets = null;

getTweetsAsync(function(tweets) {myTweets = tweets;console.log(myTweets);});
