require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title_for_each_page,         'Arkamatch'
    assert_equal full_title_for_each_page("Home"), 'Home | Arkamatch'
  end
end