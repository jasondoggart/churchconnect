class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :subject
      t.string :text
      t.references :ministry, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
