var React = require('react');

var CreateAccount = React.createClass({
    getInitialState: function() {
        return {
            owner: null,
            amount: 0,
            type: "Personal"
        };
    },
    render: function() {
        return (
            <form onSubmit={this.addAccount} className="add-account">
                <label>Owner:<input type="text" value={this.state.owner} placeholder="Owner...." onChange={this.ownerChange}/></label>
                <label>Amount:<input type="number" value={this.state.amount} placeholder="5000" onChange={this.amountChange}/></label>
                <label>
                    Type:
                    <select onChange={this.typeChange} value={this.state.type}>
                        <option value="Personal">Personal</option>
                        <option value="Business">Business</option>
                    </select>
                </label>
                <input type="submit" value="Add Account" />
            </form>
        );
    },
    ownerChange: function(e) {
        e.preventDefault();
        this.setState({owner: e.target.value});
    },
    amountChange: function(e) {
        e.preventDefault();
        this.setState({amount: parseInt(e.target.value)});
    },
    typeChange: function(e) {
        e.preventDefault();
        console.log(e.target);
        this.setState({type: e.target.options[e.target.selectedIndex].value});
    },
    addAccount: function(e) {
        e.preventDefault();
        this.props.addAccount(this.state);
        this.setState({owner: null, amount: 0, type: "Personal"});
    }

});

module.exports = CreateAccount;
