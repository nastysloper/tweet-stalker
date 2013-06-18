get '/' do
  erb :index
end

post '/get_tweets/:username' do
  @user = Twitteruser.find_or_create_by_username(params)
  if @user.tweets_stale? == true
    @user.fetch_tweets!
    erb :_tweet, layout: false
  else
    "SHAZAM"
  end
end

post '/' do
  user = Twitteruser.find_or_create_by_username(params)
  redirect "/#{user.username}"
end

get '/:username' do |username|
  @user = Twitteruser.find_by_username(username)
  erb :tweets
end
