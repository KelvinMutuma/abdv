require 'test_helper'

class ShareIndicesControllerTest < ActionController::TestCase
  setup do
    @share_index = share_indices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:share_indices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create share_index" do
    assert_difference('ShareIndex.count') do
      post :create, share_index: { all_share_index: @share_index.all_share_index, twenty_share_index: @share_index.twenty_share_index }
    end

    assert_redirected_to share_index_path(assigns(:share_index))
  end

  test "should show share_index" do
    get :show, id: @share_index
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @share_index
    assert_response :success
  end

  test "should update share_index" do
    patch :update, id: @share_index, share_index: { all_share_index: @share_index.all_share_index, twenty_share_index: @share_index.twenty_share_index }
    assert_redirected_to share_index_path(assigns(:share_index))
  end

  test "should destroy share_index" do
    assert_difference('ShareIndex.count', -1) do
      delete :destroy, id: @share_index
    end

    assert_redirected_to share_indices_path
  end
end
