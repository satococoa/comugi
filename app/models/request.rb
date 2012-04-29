class Request < ActiveRecord::Base
  attr_accessible :target_id, :user_id

  belongs_to :user
  has_one :love

  validates :user_id, presence: true
  validates :target_id, presence: true

  after_create :fall_in_love
  after_destroy :destroy_love

  def target(options = {})
    users = if options[:users].try(:values_at, target_id).nil?
              user.twitter_users([target_id])
            else
              options[:users]
            end
    users[target_id]
  end

  def fall_in_love
    create_love if self.class.where(target_id: user.uid, user_id: target_id).count > 0
  end

  def destroy_love
    love.destroy unless love.nil?
  end
end
