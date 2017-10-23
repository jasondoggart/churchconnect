class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cellphone, :string
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :postal_code, :string
  end
end
