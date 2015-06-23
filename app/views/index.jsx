var React = require('react');
var Layout = require('./layouts/layout.jsx');

var HelloMessage = React.createClass({
  render: function() {
    return (
        <Layout title={this.props.title}>
          <h1>Hello {this.props.title}</h1>
        </Layout>
    );
  }
});

module.exports = HelloMessage;