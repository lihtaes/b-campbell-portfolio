module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
    end

    client.search("#rails", result_type: 'recent', lang: 'en').take(6).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end

  def self.instagram_search
    data_load = HTTParty.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{ENV.fetch('INSTAGRAM_ACCESS_TOKEN')}&count=8")

    data_load['data'].collect do |photo|
      photos = []
      photos.push("#{photo['images']['thumbnail']['url']}", "#{photo['images']['thumbnail']['width']}" )
    end
  end

end


