require 'test_helper'

class UniversityCoursesControllerTest < ActionController::TestCase
  setup do
    @university_course = university_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:university_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create university_course" do
    assert_difference('UniversityCourse.count') do
      post :create, university_course: {  }
    end

    assert_redirected_to university_course_path(assigns(:university_course))
  end

  test "should show university_course" do
    get :show, id: @university_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @university_course
    assert_response :success
  end

  test "should update university_course" do
    patch :update, id: @university_course, university_course: {  }
    assert_redirected_to university_course_path(assigns(:university_course))
  end

  test "should destroy university_course" do
    assert_difference('UniversityCourse.count', -1) do
      delete :destroy, id: @university_course
    end

    assert_redirected_to university_courses_path
  end
end
