require 'test_helper'

class XopusPdfsControllerTest < ActionController::TestCase
  setup do
    @xopus_pdf = xopus_pdfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xopus_pdfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xopus_pdf" do
    assert_difference('XopusPdf.count') do
      post :create, xopus_pdf: {  }
    end

    assert_redirected_to xopus_pdf_path(assigns(:xopus_pdf))
  end

  test "should show xopus_pdf" do
    get :show, id: @xopus_pdf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xopus_pdf
    assert_response :success
  end

  test "should update xopus_pdf" do
    patch :update, id: @xopus_pdf, xopus_pdf: {  }
    assert_redirected_to xopus_pdf_path(assigns(:xopus_pdf))
  end

  test "should destroy xopus_pdf" do
    assert_difference('XopusPdf.count', -1) do
      delete :destroy, id: @xopus_pdf
    end

    assert_redirected_to xopus_pdfs_path
  end
end
