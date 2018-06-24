require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:ray)
  end

  test "unsuccessful edits" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:                  "",
                                              email:                 "invalid@email",
                                              password:              "pass",
                                              password_confirmation: "word" } }

    assert_template 'users/edit'
  end
end
