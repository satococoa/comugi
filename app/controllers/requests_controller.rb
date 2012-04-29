class RequestsController < ApplicationController
  before_filter :require_login

  def index
    @requests = current_user.requests.all
    unless @requests.empty?
      user_ids = @requests.map {|request| request.target_uid}
      @users = current_user.twitter_users(user_ids)
    else
      @users = []
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  def create
    @request = current_user.requests.create(
      target_uid: params[:target_uid], user_uid: current_user.uid)
  end

  def destroy
    @request = current_user.requests.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url } 
      format.json { head :no_content }
    end
  end
end
