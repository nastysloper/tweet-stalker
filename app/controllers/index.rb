get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  user = Twitteruser.find_or_create_by_username(params)
  redirect "/#{user.username}"
end

get '/:username' do |username|
  @user = Twitteruser.find_by_username(username)
  
  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  erb :tweets
end
