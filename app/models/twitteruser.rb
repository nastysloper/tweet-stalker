class Twitteruser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    username = self.username
    tweets = Twitter.user_timeline(username)
    tweets.each do |tweet|
      self.tweets << Tweet.create(tweet: tweet.attrs[:text], tweet_time: tweet.attrs[:created_at])
    end
  end

  def tweets_stale?
    return true if self.tweets.empty? 
    last_updated_time = self.tweets.last.updated_at
    minutes_since_last_fetch = (Time.now - last_updated_time) / 60
    if minutes_since_last_fetch > 0
      self.tweets.destroy_all
      return true
    else
      return false
    end
  end
end
