class TwitterInfo
  include MongoMapper::Document

  key :uid,         Integer, :unique => true

  key :nickname,     String
  key :name,         String
  key :location,     String
  key :image_url,    String
  key :description,  String
  key :twitter_url,  String
  key :website_url,  String

  key :oauth_token,  String
  key :oauth_secret, String

  belongs_to :user

  def self.hash_with_omniauth(auth)
    hash = {:uid         => auth['uid'],
            :name        => auth['info']['name'],
            :nickname    => auth['info']['nickname'],
            :description => auth['info']['description'],
            :image_url   => auth['info']['image'],
            :twitter_url => auth['info']['urls']['Twitter'],
            :website_url => auth['info']['urls']['Website']}

    unless Application::ALWAYS_REQUIRE_TWITTER_AUTH
      hash[:oauth_token] = auth['credentials']['token']
      hash[:oauth_secret] = auth['credentials']['secret']
    end

    hash
  end

  def self.create_with_omniauth(auth)
    create!(TwitterInfo.hash_with_omniauth(auth))
  end

  def update_with_omniauth(auth)
    update_attributes!(TwitterInfo.hash_with_omniauth(auth))
  end

  def tweet(message)
    Twitter.configure do |config|
      config.consumer_key    = ENV["authorizations_twitter_id"]
      config.consumer_secret = ENV["authorizations_twitter_secret"]

      if Application::ALWAYS_REQUIRE_TWITTER_AUTH
        config.oauth_token_secret = session[:twitter_secret]
        config.oauth_token        = session[:twitter_token]
      else
        config.oauth_token_secret = author.user.twitter.oauth_secret
        config.oauth_token        = author.user.twitter.oauth_token
      end
    end

    Twitter.update(message)
  end
end
