require 'test_helper'
class Researchers::SessionsControllerTest < ActionController::TestCase
  test "should display login page" do    
    @request.env["devise.mapping"] = Devise.mappings[:researcher]
    get :new
    assert_response :success
    assert_template "researchers/sessions/new"
    assert_template layout: "layouts/application"
  end
  test "should sign in user for correct entries" do    
    @request.env["devise.mapping"] = Devise.mappings[:researcher]
    val=Researcher.new
    val.username="hello"
    val.password="asdgfert"
    val.save!    
    sign_in val
    assert_response :success        
    assert_redirected_to 'researchers/show'      
  end   
  test "should not sign in users not present in database" do
    @request.env["devise.mapping"] = Devise.mappings[:researcher]
    val=Researcher.new
    val.username="abdo"
    sign_in val
    #assert_not researcher_signed_in?(val)   
  end
  test "shoud not sign in user with wrong password" do
    @request.env["devise.mapping"] = Devise.mappings[:researcher]
    val=Researcher.new
    val.username="mulham_almaleh"
    val.password="dddfeged"
    sign_in val
    #assert_not researcher_signed_in?(val)
  end
  test "should destroy session" do
    @request.env["devise.mapping"] = Devise.mappings[:researcher]
    val=Researcher.new    
    sign_out val        
    assert_response :success    
    #assert_not researcher_signed_in?(val)
  end

end
