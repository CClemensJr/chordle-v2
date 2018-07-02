require 'test_helper'

class UsersProfilePageTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:ray)
  end

  test "profile page displays" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', complete_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.chores.count.to_s, response.body
    assert_select 'div.pagination'
    @user.chores.paginate(page: 1).each do |chore|
      assert_match chore.description, response.body
    end
  end
end
