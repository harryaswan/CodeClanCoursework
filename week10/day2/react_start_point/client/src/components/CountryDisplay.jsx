var React = require('react');
var PropTypes = React.PropTypes;

var CountryDisplay = React.createClass({

    render: function() {

        var name = "Not selected";
        var population = "N/A";
        var dataBits = [];

        if (this.props.country) {
            name = this.props.country.name;
            population = this.props.country.population;
            for (var key of Object.keys(this.props.country)) {
                dataBits.push(<p key={key}>{key}: {JSON.stringify(this.props.country[key])}</p>);
            }
        }


        return (
            <div>
                <div className="countryInfo">
                    <p><b>Name:</b> {name}</p>
                    <p><b>Population:</b> {population}</p>
                </div>

                <div className="dataDump">
                    <b>All Data:</b>
                    { dataBits }
                </div>
            </div>
        );
    }

});

module.exports = CountryDisplay;
