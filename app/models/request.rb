class Request < ActiveRecord::Base
  attr_accessible :target_id, :user_id

  belongs_to :user
  has_one :target, class_name: 'User'

  validates :user_id, presence: true
  validates :target_id, presence: true
end
