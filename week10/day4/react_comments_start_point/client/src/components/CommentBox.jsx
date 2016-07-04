var React = require('react');
var CommentList = require('./CommentList');
var CommentForm = require('./CommentForm');

var CommentBox = React.createClass({
  getInitialState: function() {
      return {data: [ { _id:1, author:'Loading....', text:'Loading....' } ]};
  },
  componentDidMount: function() {
      this.grabComments();
      setInterval(this.grabComments, 1000);
  },
  handleCommentSubmit: function(comment) {
    var comments = this.state.data;
    comment._id = Date.now();
    var newComments = comments.concat([comment]);
    var req = new XMLHttpRequest();
    req.open('POST', this.props.url);
    req.setRequestHeader('Content-Type', 'application/json');
    req.onload = function() {
        if (req.status === 200) {
            // this.grabComments();
        }
    }.bind(this);
    req.send(JSON.stringify(comment));
    this.setState({data: newComments});
  },
  render: function() {
    return (
      <div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={this.state.data} deleteComment={this.deleteComment}/>
        <CommentForm onCommentSubmit={this.handleCommentSubmit} />
      </div>
    );
},
deleteComment: function(commentID) {
    var req = new XMLHttpRequest();
    req.open('delete', this.props.url);
    req.setRequestHeader('Content-Type', 'application/json');
    req.send(JSON.stringify({_id: commentID}));

    var filteredAccount = this.state.data.filter(function(comment) {
        return commentID !== comment._id;
    });

    this.setState({data: filteredAccount});

},
grabComments: function() {
    var req = new XMLHttpRequest();
    req.open('get', this.props.url);
    req.onload = function() {
        if (req.status === 200) {
            this.setState({data: JSON.parse(req.responseText)});
        }
    }.bind(this);
    req.send(null);
}
});

module.exports = CommentBox;
