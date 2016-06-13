var Bank = require('./bank/bank.js');
var Account = require('./bank/account.js');
var BankView = require('./bank/bank_view.js');
var sample = require('./sample.json');

var main = function() {
    var bank = null;
    var tmpBank = localStorage.getItem('bank_data');
    if (tmpBank) {
        bank = tmpBank;
    } else {
        bank = new Bank();
    }
    // createAccounts(bank);
    var bankView = new BankView(document.getElementById('bank_view'), bank);
    bankView.render();

};

var createAccounts = function(bank) {
    for (var i = 0; i < sample.length; i++) {
        bank.addAccount(sample[i]);
    }
};
window.onload = main;
