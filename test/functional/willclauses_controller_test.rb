require 'test_helper'

class WillclausesControllerTest < ActionController::TestCase
  setup do
    @willclause = willclauses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:willclauses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create willclause" do
    assert_difference('Willclause.count') do
      post :create, :willclause => @willclause.attributes
    end

    assert_redirected_to willclause_path(assigns(:willclause))
  end

  test "should show willclause" do
    get :show, :id => @willclause.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @willclause.to_param
    assert_response :success
  end

  test "should update willclause" do
    put :update, :id => @willclause.to_param, :willclause => @willclause.attributes
    assert_redirected_to willclause_path(assigns(:willclause))
  end

  test "should destroy willclause" do
    assert_difference('Willclause.count', -1) do
      delete :destroy, :id => @willclause.to_param
    end

    assert_redirected_to willclauses_path
  end
end
