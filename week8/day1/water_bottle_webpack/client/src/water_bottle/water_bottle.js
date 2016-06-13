var bottle = {
    volume: 0,
    fill: function() {
        this.volume = 100;
    },
    empty: function() {
        this.volume = 0;
    },
    drinkFrom: function() {
        this.volume -= 10;
        if (this.volume < 0) {
            this.volume = 0;
        }
        return 10;
    }
};
module.exports = bottle;
