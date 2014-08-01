require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  include Devise::TestHelpers
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end
end
