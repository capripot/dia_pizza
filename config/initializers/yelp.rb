require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = Figleaf::Settings.yelp.consumer_key
  config.consumer_secret = Figleaf::Settings.yelp.consumer_secret
  config.token = Figleaf::Settings.yelp.token
  config.token_secret = Figleaf::Settings.yelp.token_secret
end
