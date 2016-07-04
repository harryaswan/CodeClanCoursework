var React = require('react');

var AccountList = React.createClass({

    render: function() {
        var list = <h2>No Accounts Present</h2>

        if (this.props.accounts.length) {

            list = (
                <ul>
                    {this.props.accounts.map(function(account) {
                        var delFun = function() {
                            this.props.deleteAccount(account.id);
                        }.bind(this);
                        var editFun = function() {
                            this.props.selectAccount(account.id);
                        }.bind(this);
                        return (<li key={account.id}><span className="owner-name">{account.owner}:</span> £{account.amount}<button onClick={delFun}>Delete</button><button onClick={editFun}>View/Edit Details</button></li>);
                    }.bind(this))}
                </ul>
            );
        }

        return (
            <div>
                {list}
            </div>
        );
    }

});

module.exports = AccountList;
