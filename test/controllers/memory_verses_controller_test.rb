require 'test_helper'

class MemoryVersesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @memory_verse = memory_verses(:one)
  end

  test "should get index" do
    get memory_verses_url
    assert_response :success
  end

  test "should get new" do
    get new_memory_verse_url
    assert_response :success
  end

  test "should create memory_verse" do
    assert_difference('MemoryVerse.count') do
      post memory_verses_url, params: { memory_verse: { reference: @memory_verse.reference, verse: @memory_verse.verse, verse_date: @memory_verse.verse_date } }
    end
  end

  test "should show memory_verse" do
    get memory_verse_url(@memory_verse)
    assert_response :success
  end

  test "should get edit" do
    get edit_memory_verse_url(@memory_verse)
    assert_response :success
  end

  test "should update memory_verse" do
    patch memory_verse_url(@memory_verse), params: { memory_verse: { reference: @memory_verse.reference, verse: @memory_verse.verse } }
    assert_redirected_to memory_verse_url(@memory_verse)
  end

  test "should destroy memory_verse" do
    assert_difference('MemoryVerse.count', -1) do
      delete memory_verse_url(@memory_verse)
    end

    assert_redirected_to memory_verses_url
  end
end
