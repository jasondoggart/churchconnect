class CreateMemoryVerses < ActiveRecord::Migration[5.1]
  def change
    create_table :memory_verses do |t|
      t.string :verse
      t.string :reference

      t.timestamps
    end
  end
end
