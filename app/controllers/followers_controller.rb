class FollowersController < ApplicationController
  before_filter :require_login

  def index
    @page = params[:page].presence || 0
    @users = current_user.followers(page: @page)
  end
end
