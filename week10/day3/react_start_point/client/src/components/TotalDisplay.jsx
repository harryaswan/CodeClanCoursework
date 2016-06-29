var React = require('react');

var TotalDisplay = React.createClass({

    render: function() {

        var total = (<h2>Total: £0</h2>);

        if (this.props.accounts.length) {
            var totalAmount = this.props.accounts.reduce(function(sum, account) {
                return sum + account.amount;
            }, 0);

            total = (<h2>Total{this.props.header ? ` ${this.props.header}`: ""}: £{totalAmount}</h2>);

        }

        return (
            <div>
                {total}
            </div>
        );
    }

});

module.exports = TotalDisplay;
