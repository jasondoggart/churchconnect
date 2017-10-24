class UserMinistriesController < ApplicationController
  before_action :authenticate_user!

  # POST /user_ministries
  # POST /user_ministries.json
  def create
    @ministry = Ministry.find(params[:ministry_id])
    current_user.follow(@ministry)
    respond_to do |format|
      format.html { redirect_to @ministry, notice: 'Ministry Followed' }
      format.js
    end
  end

  # DELETE /user_ministries/1
  # DELETE /user_ministries/1.json
  def destroy
    @ministry = UserMinistry.find(params[:id]).ministry
    current_user.unfollow(@ministry)
    respond_to do |format|
      format.html { redirect_to @ministry, notice: 'Unfollowed' }
      format.js
    end
  end

end
