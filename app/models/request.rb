class Request < ActiveRecord::Base
  attr_accessible :target_id, :user_id
end
