var Account = require("./account.js");

var BankView = function(container, bank) {
    this.bank = bank;
    this.container = container;
    this.create();
};


BankView.prototype = {
    render:function() {
        this.displayTotal(null, this.bank);
        this.displayAccounts(null, this.bank);
        this.displayTotal('personal', this.bank);
        this.displayAccounts('personal', this.bank);
        this.displayTotal('business', this.bank);
        this.displayAccounts('business', this.bank);
    },
    displayTotal: function(type, bank) {
        var actualType = 'total';
        var str = "Total cash in bank: £";
        if (type) {
            actualType = type + "-total";
            str = "Total " + type + " cash in bank: £";
        }
        var total = document.getElementById(actualType);
        total.innerText = str + bank.totalCash(type);
    },
    displayAccounts: function(type, bank) {
        var accounts = bank.filteredAccounts(type);
        var ulName = "accounts";
        if (type) {
            ulName = type + "-accounts";
        }
        var ul = document.getElementById(ulName);
        this.clearElement(ul);
        for (var i = 0; i < accounts.length; i++) {
            var li = document.createElement('li');
            li.innerText = accounts[i].owner + ": £" + accounts[i].amount + " - Type: " + accounts[i].type;
            ul.appendChild(li);
        }
    },
    create:function() {
        var elements = [];

        elements.push(this.createElement('button', 'addInterest', 'Add Interest'));
        elements.push(this.createElement('button', 'reset', 'Reset'));

        elements[0].onclick = function() {
            this.addInterest();
        }.bind(this);
        elements[1].onclick = function() {
            console.log("RESET....");
        };

        elements.push(this.createElement('h4', 'total', null));
        elements.push(this.createElement('ul', 'accounts', null));
        elements.push(this.createElement('h4', 'business-total', null));
        elements.push(this.createElement('ul', 'business-accounts', null));
        elements.push(this.createElement('h4', 'personal-total', null));
        elements.push(this.createElement('ul', 'personal-accounts', null));

        console.log(elements);

        for (var i = 0; i < elements.length; i++) {
            this.container.appendChild(elements[i]);
        }

    },
    addInterest: function() {
        this.bank.addInterest();
        this.render();
    },
    clearElement: function(element) {
        while (element.firstChild) {
            element.removeChild(element.firstChild);
        }
    },
    createElement:function(type, id, inner) {
        var tmp = document.createElement(type);
        tmp.setAttribute('id', id);
        tmp.innerText = inner;
        return tmp;
    }
};

module.exports = BankView;

//
//
// var main = function() {
//     var bank = new Bank();
//     createAccounts(bank);
//
//     displayTotals(bank);
//
//     document.getElementById('addInterest').onclick = function() {
//         addInterest(bank);
//     };
//     document.getElementById('reset').onclick = function() {
//         console.log("here");
//         main();
//     };
//
// };
//
// var addInterest = function(bank) {
//     bank.addInterest();
//     displayTotals(bank);
// };
//
// var displayTotal = function(type, bank) {
//     var actualType = 'total';
//     var str = "Total cash in bank: £";
//     if (type) {
//         actualType = type + "-total";
//         str = "Total " + type + " cash in bank: £";
//     }
//     var total = document.getElementById(actualType);
//     total.innerText = str + bank.totalCash(type);
// };
//
// var displayTotals = function(bank) {
//     displayTotal(null, bank);
//     displayAccounts(null, bank);
//     displayTotal('personal', bank);
//     displayAccounts('personal', bank);
//     displayTotal('business', bank);
//     displayAccounts('business', bank);
// };
//
// var displayAccounts = function(type, bank) {
//     var accounts = bank.filteredAccounts(type);
//     var ulName = "accounts";
//     if (type) {
//         ulName = type + "-accounts";
//     }
//     var ul = document.getElementById(ulName);
//     clearElement(ul);
//     for (var i = 0; i < accounts.length; i++) {
//         var li = document.createElement('li');
//         li.innerText = accounts[i].owner + ": £" + accounts[i].amount + " - Type: " + accounts[i].type;
//         ul.appendChild(li);
//     }
// };
//
// var createAccounts = function(bank) {
//
//     for (var i = 0; i < sample.length; i++) {
//         bank.addAccount(sample[i]);
//     }
// };
//
// var clearElement = function(element) {
//     while (element.firstChild) {
//         element.removeChild(element.firstChild);
//     }
// };
//
//
// window.onload = main;
