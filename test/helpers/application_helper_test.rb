require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    test "complete_title_helper" do
        assert_equal complete_title,            "Chordle"
        assert_equal complete_title("About"),   "About | Chordle"
        assert_equal complete_title("Contact"), "Contact | Chordle"
    end
end