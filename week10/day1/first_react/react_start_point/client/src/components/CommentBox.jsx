var React = require('react');
var CommentList = require('./CommentList.jsx');
var CommentForm = require('./CommentForm.jsx');

var sampleData = [
    {id: 1, author:'Keith', text:'Boom!'},
    {id: 2, author:'Rick', text:'Cool'},
    {id: 3, author:'Val', text:'Pikachu'},
    {id: 4, author:'Seumus', text:'SHOTS!'}
];

var CommentBox = React.createClass({
    getInitialState: function() {
        return {data: sampleData};
    },
    render: function() {
        return (
            <div>
                CommentBox
                <CommentList ondelete={this.handleCommentDelete} data={this.state.data} />
                <CommentForm onCommentSubmit={this.handleCommentSubmit}/>
            </div>
        );
    },
    handleCommentSubmit: function(comment) {
        comment.id = Date.now();
        var newComments = this.state.data.concat([comment]);
        this.setState({data: newComments});
    },
    handleCommentDelete: function(commentID) {
        // var comments = this.state.data;
        // for (var comment in comments) {
        //     if (comments[comment].id === commentID) {
        //         comments.splice(comment, 1);
        //         this.setState({data: comments});
        //         break;
        //     }
        // }
        // this.setState({data: comments});
        var filteredComments = this.state.data.filter(function(comment) {
            return comment.id != commentID
        });
        this.setState({data: filteredComments});
    }

});

module.exports = CommentBox;
