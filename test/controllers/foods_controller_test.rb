require 'test_helper'

class FoodsControllerTest < ActionController::TestCase
  setup do
    @food = foods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foods)
  end

  test "should create food" do
    assert_difference('Food.count') do
      post :create, food: { calories: @food.calories, name: @food.name }
    end

    assert_response 201
  end

  test "should show food" do
    get :show, id: @food
    assert_response :success
  end

  test "should update food" do
    put :update, id: @food, food: { calories: @food.calories, name: @food.name }
    assert_response 204
  end

  test "should destroy food" do
    assert_difference('Food.count', -1) do
      delete :destroy, id: @food
    end

    assert_response 204
  end
end
