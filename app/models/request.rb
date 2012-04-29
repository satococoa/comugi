class Request < ActiveRecord::Base
  attr_accessible :target_uid, :user_id, :user_uid

  belongs_to :user
  has_one :love

  validates :user_id, presence: true
  validates :target_uid, presence: true

  before_save :add_user_uid
  after_create :fall_in_love
  after_destroy :destroy_love

  def target(options = {})
    users = if options[:users].try(:values_at, target_uid).nil?
              user.twitter_users([target_uid])
            else
              options[:users]
            end
    users[target_uid]
  end

  def fall_in_love
    create_love if self.class.where(target_uid: user.uid, user_uid: target_uid).count > 0
  end

  def destroy_love
    love.destroy unless love.nil?
  end

  def add_user_uid
    self.user_uid = user.uid
  end
end
