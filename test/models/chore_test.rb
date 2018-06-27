require 'test_helper'

class ChoreTest < ActiveSupport::TestCase
  
  def setup
    @user  = users(:ray)
    @chore = Chore.new(title: "Wash dishes", time_to_complete: 30, priority: "High", user_id: @user.id)
  end
  
  test "should be valid" do
    assert @chore.valid?
  end

  test "user id should be present" do
    @chore.user_id = nil
    assert_not @chore.valid?
  end

  test "title should be present" do
    @chore.title = "   "
    assert_not @chore.valid?
  end

  
end
