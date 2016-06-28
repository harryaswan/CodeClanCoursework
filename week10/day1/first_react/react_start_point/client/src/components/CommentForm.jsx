var React = require('react');

var CommentForm = React.createClass({
    getInitialState: function() {
        return {
            author: '',
            text: ''
        };
    },
    render: function() {
        return (
            <form onSubmit={this.handleFormSubmit}>
                <input type='text' ref='author_input' placeholder='Your name....' value={this.state.author} onChange={this.handleAuthorChange}/>
                <input type='text' ref='text_input' placeholder='Your comment....' value={this.state.text} onChange={this.handleTextChange}/>
                <input type='submit' value='Add Comment' />
            </form>
        );
    },
    handleAuthorChange: function(e) {
        this.setState({'author': e.target.value});
    },
    handleTextChange: function(e) {
        this.setState({'text': e.target.value});
    },
    handleFormSubmit: function(e) {
        e.preventDefault();
        this.props.onCommentSubmit(this.state);
        this.setState({author: '', text: ''});
    }

});

module.exports = CommentForm;
