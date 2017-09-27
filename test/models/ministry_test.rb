require 'test_helper'

class MinistryTest < ActiveSupport::TestCase
  def setup
    @ministry = Ministry.new(name: "Ministry Name", description: "Ministry description")
  end

  test "should be valid" do
    assert @ministry.valid?
  end

  test "name should be present" do
    @ministry.name = ""
    assert_not @ministry.valid?
  end

  test "description should be present" do
    @ministry.description = ""
    assert_not @ministry.valid?
  end
end
