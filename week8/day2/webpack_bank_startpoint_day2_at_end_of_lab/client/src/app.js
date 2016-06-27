var Bank = require('./bank/bank.js');
var Account = require('./bank/account.js');

var createItemForAccount = function(account){
  var accountListItem = document.createElement('li');
  accountListItem.innerText = account.owner + ": £" + account.amount;
  return accountListItem;
};

var populateAccountList = function(listElement, accounts){
  for(var account of accounts){
    listElement.appendChild(createItemForAccount(account));
  }
};

var displayBank = function(bank) {

    var totalDisplay = document.getElementById('total');
    var businessTotalDisplay = document.getElementById('business-total');
    var personalTotalDisplay = document.getElementById('personal-total');

    totalDisplay.innerText = "Total: £" + bank.totalCash();
    businessTotalDisplay.innerText = "Total Business: £" + bank.totalCash('business');
    personalTotalDisplay.innerText = "Total Personal: £" + bank.totalCash('personal');

    var businessAccountList = document.getElementById('business-accounts');
    var personalAccountList = document.getElementById('personal-accounts');

    businessAccountList.innerHTML = null;
    personalAccountList.innerHTML = null;

    populateAccountList(businessAccountList, bank.filteredAccounts('business'));
    populateAccountList(personalAccountList, bank.filteredAccounts('personal'));
};

var url = "http://localhost:3000/accounts";

var initialLoad = function(bank) {
    var request = new XMLHttpRequest();
    request.open("GET", url);

    request.onload = function(e) {
        if (request.status === 200) {
            var sampleAccounts = JSON.parse(request.responseText);
            for(var account of sampleAccounts){
              bank.addAccount(new Account(account));
            }
            displayBank(bank);
        }
    };
    request.send(null);
};

window.onload = function(){
  var bank = new Bank();

  initialLoad(bank);

  var form = document.getElementById('add_account');

  form.onsubmit = function(e) {
      e.preventDefault();
      var account = {
          owner: document.querySelector("#owner").value,
          amount: parseInt(document.querySelector("#amount").value),
          type: document.querySelector("#type").value
      };
      console.log(account);
      bank.addAccount(account);
      displayBank(bank);

      var request = new XMLHttpRequest();
      request.open("POST", url);
      request.setRequestHeader("Content-Type", "application/json");

      request.onload = function(e) {
          if (request.status === 200) {
              console.log("Data saved");
          } else {
              console.log("Data lost in the void");
          }
      };
      request.send(JSON.stringify(account));

  };

};
