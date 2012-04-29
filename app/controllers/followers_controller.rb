class FollowersController < ApplicationController
  before_filter :require_login
  def index
    @users = current_user.followers
  end
end
