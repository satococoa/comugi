class FollowersController < ApplicationController
  before_filter :require_login

  def index
    @page = params[:page].presence || 0
    @users = current_user.followers(page: @page)
    @request_target_uids = current_user.requests.map {|request| request.target_uid}
  end
end
