require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    def setup
        @user = User.new(name: "Jeff Maxim", email: "frey.maxim@gmail.com", password: "foobar", password_confirmation: "foobar")
    end

    test 'user valid' do
        assert @user.valid?
    end

    test "name should be present" do
        @user.name = "     "
        assert_not @user.valid?
    end

    test "email should be present" do
        @user.email = "    "
        assert_not @user.valid?
    end

    test "email shouldn't be too long" do
        @user.email = "a" * 254 + "mrmaxim.org"
        assert_not @user.valid?
    end

    test "email validation should accept valid emails" do
        valid_addresses = ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", "first.last@foo.jp", "alice+bob@baz.cn"]
        valid_addresses.each do |adr|
            @user.email = adr
            assert @user.valid?, "#{adr.inspect} should be valid"
        end
    end

    test "email validation should reject invalid emails" do
        invalid_addresses = ["user@example,com", "user_at_foo.org", "user.name@example.", "foo@bar_baz.com", "foo@bar+baz.com"]
        invalid_addresses.each do |adr|
            @user.email = adr
            assert_not @user.valid?, "#{adr.inspect} should be invalid"
        end
    end

    test "email addresses should be unique" do
        duplicate_user = @user.dup
        duplicate_user.email = @user.email.upcase
        @user.save
        assert_not duplicate_user.valid?
    end

    test "password should be present (nonblank)" do
        @user.password = @user.password_confirmation = " " * 6
        assert_not @user.valid?
    end

    test "password should have a minimum length" do
        @user.password = @user.password_confirmation = "a" * 5
        assert_not @user.valid?
    end
end
