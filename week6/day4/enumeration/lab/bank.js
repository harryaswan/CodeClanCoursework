var _ = require('lodash');
var Account = require('./account.js');


var Bank = function(startingAccounts) {
    this.accounts = startingAccounts;
};

Bank.prototype = {
    addAccount: function(account) {
        this.accounts.push(account);
    },
    removeAccount: function(account) {
        var aI = this.accounts.indexOf(account);
        this.accounts.splice(aI, 1);
    },

    getAccountByOwner: function(name) {
        //find account with the holder name 'name'

        // for (var i = 0; i < this.accounts.length; i++) {
        //     if (this.accounts[i].name === name ) {
        //         return this.accounts[i];
        //     }
        // }

        return _.find(this.accounts, function(arr) { return arr.name === name; });

    },
    getLargestAccount: function() {
        var maxObj = new Account(null, -10000000, null);

        _.forEach(this.accounts, function(arr) {
            if (arr.amount > maxObj.amount) {
                maxObj = arr;
            }
        });
        return maxObj;

        // var maxObj = new Account(null, -10000000, null);
        // for (var i = 0; i < this.accounts.length; i++) {
        //     if (this.accounts[i].amount > maxObj.amount) {
        //         maxObj = this.accounts[i];
        //     }
        // }
        // return maxObj;


    },
    getAccountsValue: function() {
        var totalValue = 0;
        _.forEach(this.accounts, function(acc) {
            totalValue+= acc.amount;
        });
        return totalValue;

        // var totalValue = 0;
        // for (var i = 0; i < this.accounts.length; i++) {
        //     totalValue += this.accounts[i].amount;
        // }
        // return totalValue;

    },
    getAccountsAvgValue: function() {
        return (this.getAccountsValue()/this.accounts.length);
    },
    getAccountsValueByType: function(accType) {
        var totalValue = 0;
        _.forEach(this.accounts, function(acc) {
            if (acc.type === accType) {
                totalValue += acc.amount;
            }
        });
        return totalValue;

        // var totalValue = 0;
        // for (var i = 0; i < this.accounts.length; i++) {
        //     if (this.accounts[i].type === accType){
        //         totalValue += this.accounts[i].amount;
        //     }
        // }
        // return totalValue;

    }
};


module.exports = Bank;
