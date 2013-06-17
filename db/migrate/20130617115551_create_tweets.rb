class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :twitteruser
      t.text :tweet
      t.datetime :tweet_time
      t.timestamps
    end
  end
end
