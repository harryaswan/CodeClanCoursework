var Account = function(holder, startAmount, type) {
    this.name = holder;
    this.amount = startAmount;
    this.type = type;
};

module.exports = Account;
