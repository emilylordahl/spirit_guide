require 'yelp'

YELP_CONSUMER_KEY=ENV['YELP_CONSUMER_KEY']
YELP_CONSUMER_SECRET=ENV['YELP_CONSUMER_SECRET']
YELP_TOKEN=ENV['YELP_TOKEN']
YELP_TOKEN_SECRET=ENV['YELP_TOKEN_SECRET']

Yelp.client.configure do |config|
  config.consumer_key = YELP_CONSUMER_KEY
  config.consumer_secret = YELP_CONSUMER_SECRET
  config.token = YELP_TOKEN
  config.token_secret = YELP_TOKEN_SECRET
end