class User < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_many :authored_announcements, class_name: "Announcement"
  has_many :user_ministries
  has_many :announcements
  has_many :following, through: :user_ministries, source: :ministry
  has_many :followed_announcements, through: :following, source: :announcements
  has_many :followed_events, through: :following, source: :events
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
