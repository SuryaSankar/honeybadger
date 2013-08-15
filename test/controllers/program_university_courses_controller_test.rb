require 'test_helper'

class ProgramUniversityCoursesControllerTest < ActionController::TestCase
  setup do
    @program_university_course = program_university_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_university_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_university_course" do
    assert_difference('ProgramUniversityCourse.count') do
      post :create, program_university_course: {  }
    end

    assert_redirected_to program_university_course_path(assigns(:program_university_course))
  end

  test "should show program_university_course" do
    get :show, id: @program_university_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_university_course
    assert_response :success
  end

  test "should update program_university_course" do
    patch :update, id: @program_university_course, program_university_course: {  }
    assert_redirected_to program_university_course_path(assigns(:program_university_course))
  end

  test "should destroy program_university_course" do
    assert_difference('ProgramUniversityCourse.count', -1) do
      delete :destroy, id: @program_university_course
    end

    assert_redirected_to program_university_courses_path
  end
end
