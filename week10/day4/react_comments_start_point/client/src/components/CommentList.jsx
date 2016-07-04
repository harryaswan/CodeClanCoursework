var React = require('react');
var Comment = require('./Comment.jsx')
var CommentList = React.createClass({
  render: function() {

    var commentNodes = this.props.data.map(function(comment) {
      return (
        <Comment deleteComment={this.props.deleteComment} comment={comment} key={comment._id} />
      );
  }.bind(this));

    return (
      <div className="commentList">
        {commentNodes}
      </div>
    );
  }
});
module.exports = CommentList;
