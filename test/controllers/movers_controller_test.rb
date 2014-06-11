require 'test_helper'

class MoversControllerTest < ActionController::TestCase
  setup do
    @mover = movers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mover" do
    assert_difference('Mover.count') do
      post :create, mover: { mover: @mover.mover, volume: @mover.volume }
    end

    assert_redirected_to mover_path(assigns(:mover))
  end

  test "should show mover" do
    get :show, id: @mover
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mover
    assert_response :success
  end

  test "should update mover" do
    patch :update, id: @mover, mover: { mover: @mover.mover, volume: @mover.volume }
    assert_redirected_to mover_path(assigns(:mover))
  end

  test "should destroy mover" do
    assert_difference('Mover.count', -1) do
      delete :destroy, id: @mover
    end

    assert_redirected_to movers_path
  end
end
