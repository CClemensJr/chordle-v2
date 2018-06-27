require 'test_helper'

class ChoreTest < ActiveSupport::TestCase
  
  def setup
    @user  = users(:ray)
    @chore = Chore.new(description: "Wash dishes", time_to_complete: "30", priority: "High", user_id: @user.id)
  end
  
  test "should be valid" do
    assert @chore.valid?
  end

  test "description should be present" do
    @chore.description = "   "
    assert_not @chore.valid?
  end

  test "descriptions should not be more that 255 characters long" do
    @chore.description = "a" * 256
    assert_not @chore.valid?
  end

  test "time to complete should be present" do
    @chore.time_to_complete = "   "
    assert_not @chore.valid?
  end

  test "the time to complete should not be more than 15 characters long" do
    @chore.time_to_complete = "1" * 16
    assert_not @chore.valid?
  end

  test "priority should be present" do
    @chore.priority = "   "
    assert_not @chore.valid?
  end

  test "user id should be present" do
    @chore.user_id = nil
    assert_not @chore.valid?
  end

end
