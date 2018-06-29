require 'test_helper'

class ChoreTest < ActiveSupport::TestCase
  
  def setup
    @user  = users(:ray)
    @chore = @user.chores.build(description: "Wash dishes", time_to_complete: 30, priority: "High")
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
    @chore.time_to_complete = nil
    assert_not @chore.valid?
  end

  test "the time to complete should be an integer" do
    @chore.time_to_complete = "a"
    assert_not @chore.valid?
  end

  test "priority should be present" do
    @chore.priority = "   "
    assert_not @chore.valid?
  end

  test "priority should be High, Medium, or Low" do
    @chore.priority = "priority"
    assert_not @chore.valid?
  end

  test "user id should be present" do
    @chore.user_id = nil
    assert_not @chore.valid?
  end

  test "chores should appear with the most recent first" do
    assert_equal chores(:dust_furniture), Chore.first
  end

end
