class Request < ActiveRecord::Base
  attr_accessible :target_id, :user_id

  belongs_to :user
  has_one :love

  validates :user_id, presence: true
  validates :target_id, presence: true

  def target(options = {})
    users = if options[:users].try(:values_at, target_id).nil?
              user.twitter_users([target_id])
            else
              options[:users]
            end
    users[target_id]
  end
end
