HtmlWebpackPlugin = require('html-webpack-plugin')
webpack = require('webpack')
path = require('path')
UglifyJsPlugin = require('uglifyjs-webpack-plugin')

config =
  devtool: "inline-source-map"
  entry: './src/main'
  output:
    path: path.resolve(__dirname, 'dist')
    filename: 'bundle.js'
  module: rules: [ {
    test: /\.coffee$/,
    loader: "coffee-loader"
    options: transpile: presets: ['env']
  }
  
  {
    test: /\.(png|jp(e*)g|gif|json)$/
    use:
      loader: 'url-loader'
      options:
        limit: 100
        name: 'assets/[name].[ext]'
  }
  ]
  resolve: extensions: [".web.coffee", ".web.js", ".coffee", ".js"]
  plugins: [
    new HtmlWebpackPlugin()
  ]



module.exports = config
