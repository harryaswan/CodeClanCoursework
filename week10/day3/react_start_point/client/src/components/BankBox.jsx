var React = require('react');
var sampleData = require('../sample_accounts.js');

var TotalDisplay = require('./TotalDisplay.jsx');
var AccountBox = require('./AccountBox.jsx');
var InterestButton = require('./InterestButton.jsx');
var CreateAccount = require('./CreateAccount.jsx');
var DetailsDisplay = require('./DetailsDisplay.jsx');

var BankBox = React.createClass({
    getInitialState: function() {
        return {
            accounts: sampleData,
            selectedAccount: sampleData[0]
        };
    },
    render: function() {
        return (
            <div>
                <TotalDisplay accounts={this.state.accounts} />
                <InterestButton addInterest={this.addInterest} />
                <AccountBox accounts={this.getAccounts('type', 'Personal')} accountType="Personal" deleteAccount={this.deleteAccount} selectAccount={this.selectAccount}/>
                <AccountBox accounts={this.getAccounts('type', 'Business')} accountType="Business" deleteAccount={this.deleteAccount} selectAccount={this.selectAccount}/>
                <DetailsDisplay account={this.state.selectedAccount} saveDetails={this.saveDetails} />
                <CreateAccount addAccount={this.addAccount} />
            </div>
        );
    },
    getAccounts: function(key, val) {
        return this.state.accounts.filter(function(account) {
            return (account[key] === val);
        });
    },
    addInterest: function() {
        this.setState({accounts: this.state.accounts.map(function(account) {
            account.amount = account.amount + (account.amount/10);
            return account;
        })});
    },
    addAccount: function(accountObj, callback) {
        var newAccounts = this.state.accounts;
        accountObj.id = newAccounts.length;
        newAccounts.push(accountObj);
        this.setState({accounts: newAccounts}, callback);
    },
    deleteAccount: function(accId, callback) {
        var newAccounts = this.state.accounts.filter(function(account) {
            return account.id !== accId
        });
        this.setState({accounts: newAccounts}, callback);
    },
    selectAccount: function(accId, callback) {
        var account = this.state.accounts.find(function(account) {
            return account.id === accId;
        });
        this.setState({selectedAccount: account}, callback);
    },
    saveDetails: function(accountEdit) {
        var newAccounts = this.state.accounts;
        for (var i = 0; i < newAccounts.length; i++) {
            console.log(accountEdit, newAccounts[i]);
            if (newAccounts[i].id === accountEdit.id) {
                newAccounts[i].owner = accountEdit.owner;
                newAccounts[i].amount = accountEdit.amount;
                newAccounts[i].type = accountEdit.type;
                newAccounts[i].details = accountEdit.details;
                console.log('set');
            }
        }
        // for (var account of newAccounts) {
        //     console.log(accountEdit.id, account.id);
        //     if (account.id === accountEdit.id) {
        //         account = accountEdit;
        //         console.log('set', account);
        //     }
        // }
        console.log('na',newAccounts);
        this.setState({accounts: newAccounts}, this.selectAccount(accountEdit.id));

        // this.deleteAccount(account.id, function() {
        //     this.addAccount(account, function() {
        //         this.selectAccount(account.id);
        //     }.bind(this));
        // }.bind(this));
    }

});

module.exports = BankBox;
