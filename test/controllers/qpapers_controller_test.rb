require 'test_helper'

class QpapersControllerTest < ActionController::TestCase
  setup do
    @qpaper = qpapers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qpapers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qpaper" do
    assert_difference('Qpaper.count') do
      post :create, qpaper: { create: @qpaper.create, destroy: @qpaper.destroy, edit: @qpaper.edit, index: @qpaper.index, new: @qpaper.new, show: @qpaper.show, update: @qpaper.update }
    end

    assert_redirected_to qpaper_path(assigns(:qpaper))
  end

  test "should show qpaper" do
    get :show, id: @qpaper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qpaper
    assert_response :success
  end

  test "should update qpaper" do
    patch :update, id: @qpaper, qpaper: { create: @qpaper.create, destroy: @qpaper.destroy, edit: @qpaper.edit, index: @qpaper.index, new: @qpaper.new, show: @qpaper.show, update: @qpaper.update }
    assert_redirected_to qpaper_path(assigns(:qpaper))
  end

  test "should destroy qpaper" do
    assert_difference('Qpaper.count', -1) do
      delete :destroy, id: @qpaper
    end

    assert_redirected_to qpapers_path
  end
end
