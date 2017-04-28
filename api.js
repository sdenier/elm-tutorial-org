const jsonServer = require('json-server')

const server = jsonServer.create()

// logger, static, cors, no-cache
server.use(jsonServer.defaults())

const router = jsonServer.router('db.json')
server.use(router)

console.log('Listening at 4000')
server.listen(4000)
