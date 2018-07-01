require 'test_helper'

class ChoresControllerTest < ActionDispatch::IntegrationTest
  def setup
    @chore = chores(:do_dishes)
  end

  test "should redirect create when not logged in" do
    assert_no_difference "Chore.count" do
      post chores_path, params: { chore: { description:      @chore.description,
                                           time_to_complete: @chore.time_to_complete,
                                           priority:         @chore.priority } }
    end

    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference "Chore.count" do
      delete chore_path(@chore)
    end

    assert_redirected_to login_url
  end
end
