class UsersController < ApplicationController
  def show
    @user = current_user
    @memory_verses = MemoryVerse.all
  end
end
