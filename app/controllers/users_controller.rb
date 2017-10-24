class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @memory_verses = MemoryVerse.all
  end
end
