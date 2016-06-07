var assert = require('chai').assert;
var _ = require('lodash');

var Account = require('../account.js');
var Bank = require('../bank');


describe('Account', function() {
    beforeEach(function() {
        account = new Account("Dave", 589, "personal");
    });
    it('Should have a starting name', function() {
        assert.equal("Dave", account.name);
    });
    it('Should have a starting amount', function() {
        assert.equal(589, account.amount);
    });
    it('Should have a starting type', function() {
        assert.equal("personal", account.type);
    });
});



describe('Bank', function() {
    beforeEach(function() {
        accounts = [new Account("Dave", 589, "personal"), new Account("Jeff", 1000, "personal"), new Account("HASCorp", 33463, "business")];
        bank = new Bank(accounts);
    });
    it('Should be able to find the account by owner name', function() {
        assert.equal(accounts[0], bank.getAccountByOwner("Dave"));
    });

    it('Should be able to find the largest account', function() {
        assert.equal(accounts[2], bank.getLargestAccount());
    });

    it('Should be able to find total value of all accounts', function() {
        assert.equal(35052, bank.getAccountsValue());
    });

    it('SShould be able to find average value of all accounts', function() {
        assert.equal(11684, bank.getAccountsAvgValue());
    });

    it('Should be able to find the total values of an account type', function() {
        assert.equal(1589, bank.getAccountsValueByType("personal"));
    });
});
