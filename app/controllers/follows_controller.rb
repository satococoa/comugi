class FollowsController < ApplicationController
  before_filter :require_login

  def index
    @page = params[:page].presence || 0
    @users = current_user.follows(page: @page)
    @request_target_ids = current_user.requests.map {|request| request.target_id}
  end
end
