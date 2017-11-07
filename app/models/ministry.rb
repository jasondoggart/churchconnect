class Ministry < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :events
  has_many :announcements
  has_many :user_ministries
  has_many :ministry_editors
  has_many :users, through: :ministry_editors
  accepts_nested_attributes_for :ministry_editors, allow_destroy: true

  def editors
    self.users + User.where("admin = ?", true)
  end
end
