require 'test_helper'

class TraineesControllerTest < ActionController::TestCase
  setup do
    @trainee = trainees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainees)
  end

  test "should create trainee" do
    assert_difference('Trainee.count') do
      post :create, trainee: { bio: @trainee.bio, height: @trainee.height, name: @trainee.name, trainer_id: @trainee.trainer_id, weight: @trainee.weight }
    end

    assert_response 201
  end

  test "should show trainee" do
    get :show, id: @trainee
    assert_response :success
  end

  test "should update trainee" do
    put :update, id: @trainee, trainee: { bio: @trainee.bio, height: @trainee.height, name: @trainee.name, trainer_id: @trainee.trainer_id, weight: @trainee.weight }
    assert_response 204
  end

  test "should destroy trainee" do
    assert_difference('Trainee.count', -1) do
      delete :destroy, id: @trainee
    end

    assert_response 204
  end
end
