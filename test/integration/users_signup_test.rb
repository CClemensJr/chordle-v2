require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    #Make sure the signup page can be visited
    get signup_path

    #Make sure no users are added to the db
    assert_no_difference "User.count" do
      #Make sure the signup form is linked to the signup path
      assert_select 'form[action="/signup"]'

      #With invalid parameters
      post signup_path, params: { user: { name:                  "",
                                          email:                 "user@invalid",
                                          password:              "pass",
                                          password_confirmation: "word"} }
    end

    #Render the signup page if submission fails
    assert_template 'users/new'
    #Make sure there is an element for the error_explanation
    assert_select 'div#error_explanation'
    #Make sure there is an element for the actual error message
    assert_select 'div.field_with_errors'
  end
end
