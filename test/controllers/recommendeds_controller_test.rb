require 'test_helper'

class RecommendedsControllerTest < ActionController::TestCase
  setup do
    @recommended = recommendeds(:one)
  end

  test "should get index" do
    get :position
    assert_response :success
    assert_not_nil assigns(:recommendeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recommended" do
    assert_difference('Recommended.count') do
      post :create, recommended: {index: @recommended.index, product: @recommended.product}
    end

    assert_redirected_to recommended_path(assigns(:recommended))
  end

  test "should show recommended" do
    get :show, id: @recommended
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recommended
    assert_response :success
  end

  test "should update recommended" do
    patch :update, id: @recommended, recommended: {index: @recommended.index, product: @recommended.product}
    assert_redirected_to recommended_path(assigns(:recommended))
  end

  test "should destroy recommended" do
    assert_difference('Recommended.count', -1) do
      delete :destroy, id: @recommended
    end

    assert_redirected_to recommendeds_path
  end
end
