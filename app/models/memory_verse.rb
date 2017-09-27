class MemoryVerse < ApplicationRecord
  default_scope -> { order(verse_date: :desc) }
  validates :verse, presence: true
  validates :reference, presence: true
  validates :verse_date, presence: true
end
