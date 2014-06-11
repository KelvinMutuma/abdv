require 'test_helper'

class ForexesControllerTest < ActionController::TestCase
  setup do
    @forex = forexes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forexes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forex" do
    assert_difference('Forex.count') do
      post :create, forex: { buy: @forex.buy, currency: @forex.currency, mean: @forex.mean, sell: @forex.sell }
    end

    assert_redirected_to forex_path(assigns(:forex))
  end

  test "should show forex" do
    get :show, id: @forex
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forex
    assert_response :success
  end

  test "should update forex" do
    patch :update, id: @forex, forex: { buy: @forex.buy, currency: @forex.currency, mean: @forex.mean, sell: @forex.sell }
    assert_redirected_to forex_path(assigns(:forex))
  end

  test "should destroy forex" do
    assert_difference('Forex.count', -1) do
      delete :destroy, id: @forex
    end

    assert_redirected_to forexes_path
  end
end
