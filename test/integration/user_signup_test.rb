require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

    test "invalid user doesn't signup" do
        get signup_path
        assert_no_difference 'User.count' do
            post signup_path, user: {
                name: "",
                email: "email@invalid",
                password: "airjeff",
                password_confirmation: "airjeff"
            }
        end
        assert_template 'users/new'
    end

    test "valid user does signup" do
        get signup_path
        assert_difference('User.count', 1) do
            post_via_redirect signup_path, user: {
                name: "jeff",
                email: "email@example.com",
                password: "airjeff",
                password_confirmation: "airjeff"
            }
        end
        assert_template 'urls/index'
    end

end
