class GithubInfo
  include MongoMapper::Document

  key :uid,          Integer, :unique => true

  key :login,        String
  key :bio,          String
  key :website_url,  String
  key :profile_url,  String
  key :hireable,     Boolean
  key :public_repos, Integer
  key :public_gists, Integer
  key :type,         String
  key :email,        String
  key :image_url,    String
  key :followers,    Integer
  key :following,    Integer

  key :oauth_token,  String
  key :oauth_secret, String

  belongs_to :user

  def self.hash_with_omniauth(auth)
    hash = {:uid          => auth['uid'],
            :login        => auth['extra']['raw_info']['login'],
            :bio          => auth['extra']['raw_info']['bio'],
            :website_url  => auth['extra']['raw_info']['blog'],
            :profile_url  => auth['extra']['raw_info']['html_url'],
            :hireable     => auth['extra']['raw_info']['hireable'],
            :public_repos => auth['extra']['raw_info']['public_repos'],
            :public_gists => auth['extra']['raw_info']['public_gists'],
            :type         => auth['extra']['raw_info']['type'],
            :email        => auth['extra']['raw_info']['email'],
            :image_url    => auth['extra']['raw_info']['avatar_url'],
            :followers    => auth['extra']['raw_info']['followers'],
            :following    => auth['extra']['raw_info']['following']}

    unless Application::ALWAYS_REQUIRE_GITHUB_AUTH
      hash[:oauth_token] = auth['credentials']['token']
      hash[:oauth_secret] = auth['credentials']['secret']
    end

    hash
  end

  def self.create_with_omniauth(auth)
    create!(GithubInfo.hash_with_omniauth(auth))
  end

  def update_with_omniauth(auth)
    update_attributes!(GithubInfo.hash_with_omniauth(auth))
  end
end
