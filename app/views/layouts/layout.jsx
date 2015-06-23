var React = require('react');

var Layout = React.createClass({
  render: function() {
    return (
        <html>
          <head>
            <title>{this.props.title}</title>
            <link rel="stylesheet" href="css/main.css" />
            <script src="js/JSXTransformer.js"></script>
            <script src="js/react-with-addons.js"></script>
          </head>
          <body>
            {this.props.children}
          </body>
        </html>
    );
  }
});

module.exports = Layout;