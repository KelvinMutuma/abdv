require 'test_helper'

class ChangersControllerTest < ActionController::TestCase
  setup do
    @changer = changers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:changers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create changer" do
    assert_difference('Changer.count') do
      post :create, changer: { percentage_change: @changer.percentage_change, price: @changer.price, security: @changer.security }
    end

    assert_redirected_to changer_path(assigns(:changer))
  end

  test "should show changer" do
    get :show, id: @changer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @changer
    assert_response :success
  end

  test "should update changer" do
    patch :update, id: @changer, changer: { percentage_change: @changer.percentage_change, price: @changer.price, security: @changer.security }
    assert_redirected_to changer_path(assigns(:changer))
  end

  test "should destroy changer" do
    assert_difference('Changer.count', -1) do
      delete :destroy, id: @changer
    end

    assert_redirected_to changers_path
  end
end
