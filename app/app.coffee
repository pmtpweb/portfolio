Hapi = require('hapi')
react = require('react')
engine = require('hapijs-react-views')()
faker = require('faker')
good = require('good')
path = require('path')

server = new Hapi.Server();

server.connection({
  host: 'localhost',
  port: 8000
});

process.env.NODE_ENV = process.env.NODE_ENV || 'development'
caching = false if process.env.NODE_ENV is 'development'

server.views({
  defaultExtension: 'jsx',
  engines: {
    jsx: engine
  },
  path: path.join(__dirname, 'views')
  isCached: caching
});

# Application Routes
server.route({
  method: 'GET',
  path: '/',
  handler: (request, reply) =>
    reply.view('index', {
      title: 'world'
    })
});

# Serve Static Files
server.route({
  method: 'GET',
  path: '/js/react-with-addons.js',
  handler: (request, reply) =>
    reply.file('./vendors/react/react-with-addons.js');
})

server.route({
  method: 'GET',
  path: '/js/JSXTransformer.js',
  handler: (request, reply) =>
    reply.file('./vendors/react/JSXTransformer.js');
})

server.route({
  method: 'GET',
  path: '/css/main.css',
  handler: (request, reply) =>
    reply.file('./assets/css/main.css');
})

server.register({
  register: good,
  options: {
    reporters: [{
      reporter: require('good-console'),
      events: {
        response: '*',
        log: '*'
      }
    }]
  }
}, (err) =>
    throw err if err

server.start(() =>
  server.log('info', 'Server running at: ' + server.info.uri))
)