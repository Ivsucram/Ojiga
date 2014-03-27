require 'test_helper'

class FeedbackUsersControllerTest < ActionController::TestCase
  setup do
    @feedback_user = feedback_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_user" do
    assert_difference('FeedbackUser.count') do
      post :create, feedback_user: { description: @feedback_user.description, grade: @feedback_user.grade }
    end

    assert_redirected_to feedback_user_path(assigns(:feedback_user))
  end

  test "should show feedback_user" do
    get :show, id: @feedback_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback_user
    assert_response :success
  end

  test "should update feedback_user" do
    patch :update, id: @feedback_user, feedback_user: { description: @feedback_user.description, grade: @feedback_user.grade }
    assert_redirected_to feedback_user_path(assigns(:feedback_user))
  end

  test "should destroy feedback_user" do
    assert_difference('FeedbackUser.count', -1) do
      delete :destroy, id: @feedback_user
    end

    assert_redirected_to feedback_users_path
  end
end
