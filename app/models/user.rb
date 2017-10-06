class User < ApplicationRecord
  has_many :announcements
  has_many :user_ministries
  has_many :following, through: :user_ministries, source: :ministry
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # follows a ministry
  def follow(ministry)
    following << ministry
  end

  def unfollow(ministry)
    following.delete(ministry)
  end

  def following?(ministry)
    following.include?(ministry)
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end
