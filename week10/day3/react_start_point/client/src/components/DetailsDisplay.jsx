var React = require('react');

var DetailsDisplay = React.createClass({
    getInitialState: function() {
        return {
            owner: this.props.account.owner,
            amount: this.props.account.amount,
            type: this.props.account.type,
            details: this.props.account.details
        };
    },
    componentWillReceiveProps: function(nextProps) {
        this.setState({
            owner: nextProps.account.owner,
            amount: nextProps.account.amount,
            type: nextProps.account.type,
            details: nextProps.account.details
        });
    },
    render: function() {
        return (
            <div>
                <h2>Selected Account</h2>
                <form onSubmit={this.saveDetails} className="account-details">
                    <input type="text" value={this.state.owner} onChange={this.changeOwner} />
                    <input type="number" value={this.state.amount} onChange={this.changeAmount} step={0.01}/>
                    <select onChange={this.changeType} value={this.state.type}>
                        <option value="Personal">Personal</option>
                        <option value="Business">Business</option>
                    </select>
                    <textarea onChange={this.changeDetails} value={this.state.details}></textarea>
                    <input type="submit" value="Save Details" />
                </form>
            </div>
        );
    },
    saveDetails: function(e) {
        e.preventDefault();
        this.props.saveDetails(this.state);
    },
    changeOwner: function(e) {
        e.preventDefault();
        this.setState({owner: e.target.value});
    },
    changeAmount: function(e) {
        e.preventDefault();
        this.setState({amount: parseFloat(e.target.value)});
    },
    changeType: function(e) {
        e.preventDefault();
        console.log(e.target);
        this.setState({type: e.target.options[e.target.selectedIndex].value});
    },
    changeDetails: function(e) {
        e.preventDefault();
        this.setState({details: e.target.value})
    }

});

module.exports = DetailsDisplay;
