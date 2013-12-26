require "twitter"

# puts Twitter.status(167309659198328832).text

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "tte3aMLW62LC2Qi6kzomHA"
  config.consumer_secret     = "Uw2neFq6L3SXOJnJkhD06efoUanepXYdvr5gHDWaVZA"
  config.access_token        = "597293451-Uhy8nO7C7Gu05GXcA9hUYWOvpW0zPNtczpRrncqK"
  config.access_token_secret = "133cd1JtOnv1swDUFezyi9mWxuMWrCA50JmaThBJjYwLT"
end