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

  test "succesful edits" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Ray"
    email = "ray@liotta.com"
    patch user_path(@user), params: { user: { name:                  name,
                                              email:                 email,
                                              password:              "",
                                              password_confirmation: "" } }

    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal: name,  @user.name
    assert_equal: email, @user.email
  end
end
