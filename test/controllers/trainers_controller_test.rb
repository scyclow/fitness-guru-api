require 'test_helper'

class TrainersControllerTest < ActionController::TestCase
  setup do
    @trainer = trainers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainers)
  end

  test "should create trainer" do
    assert_difference('Trainer.count') do
      post :create, trainer: {  }
    end

    assert_response 201
  end

  test "should show trainer" do
    get :show, id: @trainer
    assert_response :success
  end

  test "should update trainer" do
    put :update, id: @trainer, trainer: {  }
    assert_response 204
  end

  test "should destroy trainer" do
    assert_difference('Trainer.count', -1) do
      delete :destroy, id: @trainer
    end

    assert_response 204
  end
end
