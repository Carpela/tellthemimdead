require 'test_helper'

class WillsControllerTest < ActionController::TestCase
  setup do
    @will = wills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create will" do
    assert_difference('Will.count') do
      post :create, :will => @will.attributes
    end

    assert_redirected_to will_path(assigns(:will))
  end

  test "should show will" do
    get :show, :id => @will.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @will.to_param
    assert_response :success
  end

  test "should update will" do
    put :update, :id => @will.to_param, :will => @will.attributes
    assert_redirected_to will_path(assigns(:will))
  end

  test "should destroy will" do
    assert_difference('Will.count', -1) do
      delete :destroy, :id => @will.to_param
    end

    assert_redirected_to wills_path
  end
end
