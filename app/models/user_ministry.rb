class UserMinistry < ApplicationRecord
  belongs_to :ministry
  belongs_to :user
end
