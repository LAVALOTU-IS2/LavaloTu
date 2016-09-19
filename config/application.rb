require_relative 'boot'
require 'devise'
require 'rails/all'

Bundler.require(*Rails.groups)

module LavaloTu
	class Application < Rails::Application
		config.assets.paths += %w(fonts)	
		Koala.config.api_version = 'v2.7'
		config.middleware.insert_before 0, "Rack::Cors" do
			allow do
				origins '*'
				resource '*', :headers => :any, :methods => [:get, :post, :options, :delete, :put]
			end
		end
	end
end
