class Love < ActiveRecord::Base
  attr_accessible :request_id, :user_id

  belongs_to :request
end
