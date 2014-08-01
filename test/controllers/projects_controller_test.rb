require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  include Devise::TestHelpers
  
  test "user can't view projects" do
    get :index
    assert_response :redirect, "un-logged-in user should be redirected"
    
    @user = users(:user01)
    
    sign_in @user
    
    get :index
    assert_response :success, "logged in user should access index"
    
    sign_out @user
    
    get :index
    assert_response :redirect, "logged-out user should be redirected"
  end
end
