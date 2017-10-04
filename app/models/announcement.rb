class Announcement < ApplicationRecord
  belongs_to :ministry
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
end
