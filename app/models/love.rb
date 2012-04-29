# coding: utf-8
class Love < ActiveRecord::Base
  attr_accessible :request_id

  belongs_to :request
  
  after_create :tweet
  
  def tweet
    user = request.user
    target = request.target
    user.tweet("@#{target.nickname}さんに会いたいです。 #comugi")
    target.tweet("@#{user.nickname}さんに会いたいです。 #comugi")
  end
end
