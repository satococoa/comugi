class User < ActiveRecord::Base
  attr_accessible :image, :name, :nickname, :token, :uid

  validates :uid, presence: true
  validates :token, presence: true

  def self.find_or_create_by_auth_hash(auth)
    user = User.find_or_initialize_by_uid(auth['uid'])
    user.name = auth['info']['name']
    user.nickname = auth['info']['nickname']
    user.image = auth['info']['image']
    user.token = auth['credentials']['token']
    if user.save
      user
    else
      nil
    end
  end
end
