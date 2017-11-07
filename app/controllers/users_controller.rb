class UsersController < ApplicationController
  def show
    @user = current_user
    @memory_verses = MemoryVerse.all
    @users = User.all
    @ministries = Ministry.all
    @announcements = Announcement.all
    @events = Event.all
  end
end
