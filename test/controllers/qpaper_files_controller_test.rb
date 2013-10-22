require 'test_helper'

class QpaperFilesControllerTest < ActionController::TestCase
  setup do
    @qpaper_file = qpaper_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qpaper_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qpaper_file" do
    assert_difference('QpaperFile.count') do
      post :create, qpaper_file: {  }
    end

    assert_redirected_to qpaper_file_path(assigns(:qpaper_file))
  end

  test "should show qpaper_file" do
    get :show, id: @qpaper_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qpaper_file
    assert_response :success
  end

  test "should update qpaper_file" do
    patch :update, id: @qpaper_file, qpaper_file: {  }
    assert_redirected_to qpaper_file_path(assigns(:qpaper_file))
  end

  test "should destroy qpaper_file" do
    assert_difference('QpaperFile.count', -1) do
      delete :destroy, id: @qpaper_file
    end

    assert_redirected_to qpaper_files_path
  end
end
