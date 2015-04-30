require 'test_helper'

class DecreasesControllerTest < ActionController::TestCase
  setup do
    @decrease = decreases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:decreases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create decrease" do
    assert_difference('Decrease.count') do
      post :create, decrease: { details: @decrease.details, store_id: @decrease.store_id, user_id: @decrease.user_id }
    end

    assert_redirected_to decrease_path(assigns(:decrease))
  end

  test "should show decrease" do
    get :show, id: @decrease
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @decrease
    assert_response :success
  end

  test "should update decrease" do
    patch :update, id: @decrease, decrease: { details: @decrease.details, store_id: @decrease.store_id, user_id: @decrease.user_id }
    assert_redirected_to decrease_path(assigns(:decrease))
  end

  test "should destroy decrease" do
    assert_difference('Decrease.count', -1) do
      delete :destroy, id: @decrease
    end

    assert_redirected_to decreases_path
  end
end
