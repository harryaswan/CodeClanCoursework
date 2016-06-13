var assert = require('chai').assert;
var athlete = require('../athlete');


describe('Athlete', function(){
    // Athlete should have a hydration attribute that starts at 100.
    it('Should have a hydration attribute that starts at 100', function(){
        assert.equal(100, athlete.hydration);
    });
    // Athlete should have a distance covered attribute starts at 0.
    it('Should have a distance covered attribute starts at 0', function(){
        assert.equal(0, athlete.distanceCovered);
    });
    // Athlete should be able to run: increasing distance, decreasing hydration.
    it('Should be able to run: increasing distance, decreasing hydration', function(){
        athlete.run();
        assert.equal(10, athlete.distanceCovered);
        assert.equal(90, athlete.hydration);
    });
    // Athlete should not move when running dehydrated: hydration at 0;
    it('Should not move when running dehydrated: hydration at 0', function(){
        athlete.hydration = 100;
        athlete.distanceCovered = 0;
        athlete.run(11);
        assert.equal(100, athlete.distanceCovered); //if has run 11 times it would be 110
    });
    // Athlete should be able to increase hydration by drinking from water bottle
    it('Should be able to increase hydration by drinking from water bottle', function(){
        athlete.hydration = 80;
        athlete.drink();
        assert.equal(90, athlete.hydration);
    });


});
