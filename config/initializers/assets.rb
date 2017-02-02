# Be sure to restart your server when you modify this file.
config = Rails.application.config

# Version of your assets, change this if you want to expire all your assets.
config.assets.version = '1.0'

# Add additional assets to the asset load path
config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
config.assets.precompile += %w(

)

config.browserify_rails.commandline_options = [
  "-t coffeeify",
  "-t [ babelify --presets [ es2015 react ] ]",
  "-t [ envify ]",
  "--extension=\".coffee\""
]
