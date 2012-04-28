class User < ActiveRecord::Base
  attr_accessible :image, :name, :nickname, :token, :uid
end
