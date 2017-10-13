class User < ApplicationRecord
  has_many :authored_announcements, class_name: "Announcement"
  has_many :user_ministries
  has_many :following, through: :user_ministries, source: :ministry
  has_many :announcements, through: :following
  has_many :events, through: :following
  has_many :ministry_editors
  has_many :editor_priviledges, through: :ministry_editors, source: :ministry
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # follows a ministry
  def follow(ministry)
    following << ministry
  end


  # unfollows a ministry
  def unfollow(ministry)
    following.delete(ministry)
  end

  # check if user follows a ministry
  def following?(ministry)
    following.include?(ministry)
  end

  # provides the user's full name (first and last)
  def full_name
    self.first_name + " " + self.last_name
  end

end
