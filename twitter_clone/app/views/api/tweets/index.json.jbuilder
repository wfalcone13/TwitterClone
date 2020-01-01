json.array! @tweets do |tweet|
  json.partial! 'api/tweets/tweet', tweet: tweet
end