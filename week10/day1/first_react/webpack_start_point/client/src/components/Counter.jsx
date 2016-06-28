var React = require('react');

var Counter = React.createClass({
    getInitialState: function () {
        return { count: 0, multiplier: 1 };
    },
    render: function () {
        return (
            <div>
                <h1>Hello I am Counter! { this.props.title }</h1>
                <p>The Current Count is: {this.state.count}</p>
                <button onClick={this.incrementCount}>Increment</button>
                <button onClick={this.decrementCount}>Decrement</button>
                <input type='number' onKeyUp={this.setMultiplier} />
            </div>
        );
    },
    incrementCount: function() {
        this.setState({
            count: this.state.count + this.state.multiplier
        });
    },
    decrementCount: function() {
        this.setState({
            count: this.state.count - this.state.multiplier
        });
    },
    setMultiplier: function (event) {
        console.log('t', event.target.value);
        // console.log('v', event._targetInst._nativeNode.value);
        this.setState({
            multiplier: parseInt(event.target.value)
        });
    }

});

module.exports = Counter;
