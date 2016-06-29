var React = require('react');
var PropTypes = React.PropTypes;

var InterestButton = React.createClass({

    render: function() {
        return (
            <input type="button" value="+10% Interest" onClick={this.props.addInterest} />
        );
    }

});

module.exports = InterestButton;
