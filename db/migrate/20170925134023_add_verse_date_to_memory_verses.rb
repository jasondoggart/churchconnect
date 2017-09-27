class AddVerseDateToMemoryVerses < ActiveRecord::Migration[5.1]
  def change
    add_column :memory_verses, :verse_date, :datetime
  end
end
