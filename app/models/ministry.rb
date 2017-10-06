class Ministry < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_many :events
  has_many :announcements
  has_many :user_ministries
end
