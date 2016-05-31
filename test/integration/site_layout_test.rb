require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "main layout links" do
    get root_path
    assert_template "urls/index"
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", urls_path
  end
end
