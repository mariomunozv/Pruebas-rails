require 'test_helper'

class CashRegistersControllerTest < ActionController::TestCase
  setup do
    @cash_register = cash_registers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_registers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_register" do
    assert_difference('CashRegister.count') do
      post :create, cash_register: { amount: @cash_register.amount, cashbox_id: @cash_register.cashbox_id, type: @cash_register.type, user_id: @cash_register.user_id }
    end

    assert_redirected_to cash_register_path(assigns(:cash_register))
  end

  test "should show cash_register" do
    get :show, id: @cash_register
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cash_register
    assert_response :success
  end

  test "should update cash_register" do
    patch :update, id: @cash_register, cash_register: { amount: @cash_register.amount, cashbox_id: @cash_register.cashbox_id, type: @cash_register.type, user_id: @cash_register.user_id }
    assert_redirected_to cash_register_path(assigns(:cash_register))
  end

  test "should destroy cash_register" do
    assert_difference('CashRegister.count', -1) do
      delete :destroy, id: @cash_register
    end

    assert_redirected_to cash_registers_path
  end
end
