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
    puts 'params'
    params.tapp
    puts '/params'

    @request = current_user.requests.new(target_id: params[:target_id])

    respond_to do |format|
      if @request.save
        format.json { render json: @request, status: :created, location: @request }
      else
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
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
