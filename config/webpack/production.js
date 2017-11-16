const environment = require('./environment')
const custom = require('./config')
const merge = require('webpack-merge')

module.exports = merge(environment.toWebpackConfig(), custom)
