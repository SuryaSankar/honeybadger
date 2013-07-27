require 'test_helper'

class ExamquestionsControllerTest < ActionController::TestCase
  setup do
    @examquestion = examquestions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:examquestions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create examquestion" do
    assert_difference('Examquestion.count') do
      post :create, examquestion: {  }
    end

    assert_redirected_to examquestion_path(assigns(:examquestion))
  end

  test "should show examquestion" do
    get :show, id: @examquestion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @examquestion
    assert_response :success
  end

  test "should update examquestion" do
    patch :update, id: @examquestion, examquestion: {  }
    assert_redirected_to examquestion_path(assigns(:examquestion))
  end

  test "should destroy examquestion" do
    assert_difference('Examquestion.count', -1) do
      delete :destroy, id: @examquestion
    end

    assert_redirected_to examquestions_path
  end
end
