require 'test_helper'

class CheatsheetsControllerTest < ActionController::TestCase
  setup do
    @cheatsheet = cheatsheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheatsheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheatsheet" do
    assert_difference('Cheatsheet.count') do
      post :create, cheatsheet: {  }
    end

    assert_redirected_to cheatsheet_path(assigns(:cheatsheet))
  end

  test "should show cheatsheet" do
    get :show, id: @cheatsheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheatsheet
    assert_response :success
  end

  test "should update cheatsheet" do
    patch :update, id: @cheatsheet, cheatsheet: {  }
    assert_redirected_to cheatsheet_path(assigns(:cheatsheet))
  end

  test "should destroy cheatsheet" do
    assert_difference('Cheatsheet.count', -1) do
      delete :destroy, id: @cheatsheet
    end

    assert_redirected_to cheatsheets_path
  end
end
