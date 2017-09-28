class AddUserToMinistries < ActiveRecord::Migration[5.1]
  def change
    add_reference :ministries, :users, foreign_key: true
  end
end
