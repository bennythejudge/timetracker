require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "company name should be at least 5 characters long" do
    company = Company.first
    assert company.valid?, "company should be valid"
    company.name = "abc"
    assert_not company.valid?, "company should be invalid"
  end
end
