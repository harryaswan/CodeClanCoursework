var React = require('react');
var CountrySelector = require('./CountrySelector.jsx');
var CountryDisplay = require('./CountryDisplay.jsx');

var CountriesBox = React.createClass({

    getInitialState: function() {
        return {
            countries: [],
            currentCountry: null
        };
    },

    componentDidMount: function() {
        var url = "https://restcountries.eu/rest/v1/all";
        var req = new XMLHttpRequest();
        req.open("GET", url);
        req.onload = function() {
            var data = JSON.parse(req.responseText);
            this.setState({countries: data, currentCountry:data[0]});
        }.bind(this);
        req.send(null);
    },

    render: function() {
        return (
            <div>
                <h1>🌍 Countries of The World 🌍</h1>
                <CountrySelector data={this.state.countries} oncountrychange={this.handleCountrySelect} />
                <CountryDisplay country={this.state.currentCountry}/>
            </div>
        );
    },

    handleCountrySelect: function(e) {
        e.preventDefault(); // not needed in this example - but good practice to have it here if in a form, etc.
        var country = this.state.countries[e.target.selectedIndex];
        this.setState({currentCountry: country});
    }

});

module.exports = CountriesBox;
