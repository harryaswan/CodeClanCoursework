var React = require('react');
var Comment = require('./Comment.jsx');

var CommentList = React.createClass({

    render: function() {
        var commentArray = this.props.data.map(function(item) {
            return (<Comment key={item.id} id={item.id} ondelete={this.props.ondelete} author={item.author} text={item.text} />);
        }.bind(this));

        return (
            <div>
                CommentList
                { commentArray }
            </div>
        );
    }

});

module.exports = CommentList;
