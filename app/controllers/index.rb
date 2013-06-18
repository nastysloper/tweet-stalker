get '/' do
  erb :index
end

get '/check_stale/:username' do
  user = Twitteruser.find_or_create_by_username(params)
  user.tweets_stale?.to_s
end

post '/get_tweets/:username' do |username|
  @user = Twitteruser.find_by_username(username)
  @user.fetch_tweets!
  erb :_tweet, layout: false
end

post '/' do
  user = Twitteruser.find_or_create_by_username(params)
  redirect "/#{user.username}"
end

get '/:username' do |username|
  @user = Twitteruser.find_by_username(username)
  erb :tweets
end
