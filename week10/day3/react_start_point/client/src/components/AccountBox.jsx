var React = require('react');

var TotalDisplay = require('./TotalDisplay.jsx');
var AccountList = require('./AccountList.jsx');

var AccountBox = React.createClass({

    render: function() {
        return (
            <div>
                <TotalDisplay accounts={this.props.accounts} header={this.props.accountType}/>
                <AccountList deleteAccount={this.props.deleteAccount} selectAccount={this.props.selectAccount} accounts={this.props.accounts} />
            </div>
        );
    }

});

module.exports = AccountBox;
