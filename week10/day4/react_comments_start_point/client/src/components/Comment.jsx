var React = require('react');
var Comment = React.createClass({
  render: function() {
      var delFun = function() {
          this.props.deleteComment(this.props.comment._id)
      }.bind(this);
    return (
      <div className="comment">
        <h2 className="commentAuthor">
          {this.props.comment.author}
        </h2>
        <p>
            {this.props.comment.text}
        </p>
        <button onClick={delFun}> Delete </button>
      </div>
    );
  }
});

module.exports = Comment;
