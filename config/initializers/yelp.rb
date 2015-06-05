require 'yelp'

YOUR_CONSUMER_KEY = '2FtU74xFLOX1XSxj-WoTfg'
YOUR_CONSUMER_SECRET = 'tFRTS-FfKvqmrAF5FoiH3L51fII'
YOUR_TOKEN = 'eB0LCgYRp4bHHslyZpCUaCMV2g4cjRgk'
YOUR_TOKEN_SECRET = 'P_wY_Za4KVcMEECBioUrOAssh4g'

Yelp.client.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
  config.token = YOUR_TOKEN
  config.token_secret = YOUR_TOKEN_SECRET
end