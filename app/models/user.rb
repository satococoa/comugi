class User < ActiveRecord::Base
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
end
