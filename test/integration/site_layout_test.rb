require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
 		@user = users(:michael)
 	end
  
  test "layout links when logged out" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", login_path
    
    get signup_path
    assert_template 'users/new'
    assert_equal full_title("Signup"), "Signup | Ruby on Rails Tutorial Sample App"
  end
    
   test "layout links when logged in" do
    log_in_as(@user)
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path
    assert_select "a[href=?]", edit_user_path
    assert_select "a[href=?]", logout_path
  end
  
end
