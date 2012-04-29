# coding: utf-8
class Love < ActiveRecord::Base
  attr_accessible :request_id

  belongs_to :request
  
  after_create :tweet
  
  def tweet
    user = request.user
    target = request.target
    user.tweet("@#{target.screen_name}さんに会いたいです。 #comugi")
    User.find_by_uid(target.id).tweet("@#{user.nickname}さんに会いたいです。 #comugi")
  end
end
