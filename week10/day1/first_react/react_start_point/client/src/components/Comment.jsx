var React = require('react');

var Comment = React.createClass({

    render: function() {
        var delFn = function() {
            this.props.ondelete(this.props.id)
        }.bind(this);

        return (
            <div className='comment'>
                <h2>{this.props.author}</h2>
                {this.props.text}
                <button onClick={delFn}>Delete</button>
            </div>
        );
    }

});

module.exports = Comment;
