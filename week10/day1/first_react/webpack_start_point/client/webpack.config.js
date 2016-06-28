config = {
  entry: "./src/index.jsx",
  output: {
    filename: "bundle.js",
    path: "./build"
  },
  devtool: 'source-map',
  resolve: {
      extentions: ['', '.js', '.jsx']
  },
  module: {
      loaders: [{
          test: /\.jsx?$/,
          exclude: /(node_modules)/,
          loader: 'babel',
          query: {
              presets: ['react', 'es2015']
          }
      }]
  }
};

module.exports = config;
