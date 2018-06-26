require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  #log in
  #visit index
  # verify first page is present
  # Confirm pagination is present
  def setup
    @user = users(:ray)
  end

  test "index includes pagination" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
end
