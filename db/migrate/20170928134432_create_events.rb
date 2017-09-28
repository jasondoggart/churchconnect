class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.references :ministry, foreign_key: true

      t.timestamps
    end
  end
end
