require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    # basically login with invalid info to trigger out flash messsage
    get login_path
    assert_template 'sessions/new'
    post login_path, session: {email: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?
    # make sure the flash message is not present after we load a new page
    get root_path
    assert flash.empty?
  end
end
