class RequestsController < ApplicationController
  before_filter :require_login

  def index
    @requests = current_user.requests.all
    unless @requests.empty?
      user_ids = @requests.map {|request| request.target_id}
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
    @request = current_user.requests.create(target_id: params[:target_id])
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
