require 'test_helper'

class MemoryVerseTest < ActiveSupport::TestCase

  def setup
    @memory_verse = MemoryVerse.new(verse: "A scripture verse", reference: "A reference", verse_date: "September 25, 2017")
  end

  test "should be valid" do
    assert @memory_verse.valid?
  end
  
  test "verse should be present" do
    @memory_verse.verse = ""
    assert_not @memory_verse.valid?
  end

  test "reference should be present" do
    @memory_verse.reference = ""
    assert_not @memory_verse.valid?
  end

  test "verse_date should be present" do
    @memory_verse.verse_date = ""
    assert_not @memory_verse.valid?
  end

  test "order should be most recent memory verse first" do
    assert_equal memory_verses(:most_recent), MemoryVerse.first
  end
end

