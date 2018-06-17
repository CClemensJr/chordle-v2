require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    #Make sure the signup page can be visited
    get signup_path

    #Make sure no users are added to the db
    assert_no_difference "User.count" do
      #With invalid parameters
      post users_path, params: { user: { name:                  "",
                                        email:                 "user@invalid",
                                        password:              "pass",
                                        password_confirmation: "word"} }
    end

    #Render the signup page if submission fails
    assert_template 'users/new'
  end
end
