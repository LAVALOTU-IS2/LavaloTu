# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( welcome.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( static_pages.css )
Rails.application.config.assets.precompile += %w( static_pages_contact.css )
Rails.application.config.assets.precompile += %w( registrations.css )
Rails.application.config.assets.precompile += %w( laundries.css )
Rails.application.config.assets.precompile += %w( orders.css )

Rails.application.config.assets.precompile += %w( jquery_inview.js )
Rails.application.config.assets.precompile += %w( polyfill.js )
Rails.application.config.assets.precompile += %w( app.js )
Rails.application.config.assets.precompile += %w( dashboard.js )
Rails.application.config.assets.precompile += %w( laundry.js )
Rails.application.config.assets.precompile += %w( laundry_order.js )
Rails.application.config.assets.precompile += %w( show_laundries.js )#Ordena las lavanderias por score y name para admin
Rails.application.config.assets.precompile += %w( laundries_map.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
