const environment = require('./environment')
const custom = require('./config')
const merge = require('webpack-merge')
const webpack = require('webpack');

process.env.prod = process.argv.indexOf('-p') !== -1;


module.exports = merge(environment.toWebpackConfig(), custom)
