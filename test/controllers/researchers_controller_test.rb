require 'test_helper'

class ResearchersControllerTest < ActionController::TestCase
  test "should get new" do
    @request.env["devise.mapping"] = Devise.mappings[:researcher]
    get :new
    assert_response :success, "failed to open the signup page"
  end

  

end
