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
                <AccountBox accounts={this.getAccounts('type', 'Personal')} accountType="Personal" deleteAccount={this.deleteAccount} selectAccount={this.selectAccount}/>
                <AccountBox accounts={this.getAccounts('type', 'Business')} accountType="Business" deleteAccount={this.deleteAccount} selectAccount={this.selectAccount}/>
                <DetailsDisplay account={this.state.selectedAccount} saveDetails={this.saveDetails} />
                <InterestButton addInterest={this.addInterest} />
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
        newAccounts.push(accountObj);
        this.setState({accounts: newAccounts}, callback);
    },
    deleteAccount: function(ownerName, callback) {
        var newAccounts = this.state.accounts.filter(function(account) {
            return account.owner !== ownerName
        });
        this.setState({accounts: newAccounts}, callback);
    },
    selectAccount: function(ownerName, callback) {
        var account = this.state.accounts.find(function(account) {
            return account.owner === ownerName;
        });
        this.setState({selectedAccount: account}, callback);
    },
    saveDetails: function(account) {
        console.log(account);
        this.deleteAccount(account.owner, function() {
            this.addAccount(account, function() {
                this.selectAccount(account.owner);
            }.bind(this));
        }.bind(this));
    }

});

module.exports = BankBox;
