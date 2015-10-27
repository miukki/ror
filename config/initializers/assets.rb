# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
# Rails.application.config.assets.precompile += %w( bsie/**/* )
Rails.application.config.assets.precompile += %w(
  bsie/bootstrap/css/bootstrap.css
  bsie/bootstrap/css/bootstrap-ie6.css
  bsie/bootstrap/css/ie.css
  bsie/js/jquery-1.7.2.min.js
  bsie/bootstrap/js/bootstrap.js
)
