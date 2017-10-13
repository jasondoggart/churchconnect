class CreateMinistryEditors < ActiveRecord::Migration[5.1]
  def change
    create_table :ministry_editors do |t|
      t.references :ministry, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
