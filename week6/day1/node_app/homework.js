var detective = 'Dr Watson';
var outerFunction = function(decided){
    var detective = 'Miss Marple';
    var theOtherDetective = "Sherlock";
    var innerFunctionA = function(){
        var detective = 'Hercule Poirot';
        detective = "Scooby Doo";
    };
    var innerFunctionB = function(){
        var detective = 'Hercule Poirot';
        var someAction = function() {
            var detective = "Maigret";
            if (decided) {
                theOtherDetective = "Jake Parelta";
            } else {
                detective = "Chief Clarence \"Clancy\" Wiggum";
            }
            return detective;
        };
        detective = someAction();
    };
    var innerFunctionC = function(){
        var detectiveFrost = 'Jack Frost';
        var somethingWheelyFunc = function() {
            var bestWheeledDetectiveEver = "Ironside";
            detective = bestWheeledDetectiveEver;
            return theOtherDetective;
        };
        detective = 'John Luther';

        detective = somethingWheelyFunc();
        return detective;
    };
    detective = innerFunctionA();
    detective = innerFunctionB();
    detective = innerFunctionC();
    return detective;
};
detective = outerFunction(false);
console.log('The best detective is', detective, "of course!");
//
detective = outerFunction(true);
console.log('The best detective is', detective, "of course!");
