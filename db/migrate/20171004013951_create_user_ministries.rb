class CreateUserMinistries < ActiveRecord::Migration[5.1]
  def change
    create_table :user_ministries do |t|
      t.references :user, foreign_key: true
      t.references :ministry, foreign_key: true

      t.timestamps
    end
  end
end
