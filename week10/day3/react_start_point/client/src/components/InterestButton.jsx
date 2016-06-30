var React = require('react');
var PropTypes = React.PropTypes;

var InterestButton = React.createClass({

    render: function() {
        return (
            <div className='test'><input className="interest-button" type="button" value="+10% Interest" onClick={this.props.addInterest} /></div>
        );
    }

});

module.exports = InterestButton;
