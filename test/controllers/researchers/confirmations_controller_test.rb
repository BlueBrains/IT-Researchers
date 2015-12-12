require 'test_helper'

class Researchers::ConfirmationsControllerTest < ActionController::TestCase  
  test "should get new" do
    @request.env["devise.mapping"] = Devise.mappings[:researcher]
    get :new
    assert_response :success
  end  

end
