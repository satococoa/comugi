class User < ActiveRecord::Base
  USERS_PER_PAGE = 20

  attr_accessible :image, :name, :nickname, :token, :secret, :uid

  validates :uid, presence: true
  validates :token, presence: true
  validates :secret, presence: true

  def self.find_or_create_by_auth_hash(auth)
    user = User.find_or_initialize_by_uid(auth['uid'])
    user.name = auth['info']['name']
    user.nickname = auth['info']['nickname']
    user.image = auth['info']['image']
    user.token = auth['credentials']['token']
    user.secret = auth['credentials']['secret']
    if user.save
      user
    else
      nil
    end
  end

  def follows(options = {})
    get_relations(:follows, options)
  end

  def followers(options = {})
    get_relations(:followers, options)
  end

  private
  # returns instance of Twitter::User
  def get_relations(type, options)
    configure_twitter
    result = case type
             when :follows
               Twitter.friend_ids(options)
             when :followers
               Twitter.follower_ids(options)
             end
    # next_cursor = result.next_cursor
    ids = result.ids
    options[:page] = 0 if options[:page].nil?
    offset = options[:page].to_i * USERS_PER_PAGE
    users = Twitter.users(result.collection[offset, USERS_PER_PAGE+1]).index_by(&:id)
    data = []
    ids.each {|id|
      data << users[id] unless users[id].nil?
    }
    data
  end

  def configure_twitter
    Twitter.configure do |config|
      config.consumer_key = Settings.twitter.key
      config.consumer_secret = Settings.twitter.secret
      config.oauth_token = token
      config.oauth_token_secret = secret
    end
  end
end
