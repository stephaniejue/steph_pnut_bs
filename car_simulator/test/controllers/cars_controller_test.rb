require 'test_helper'

class CarsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get info" do
    get :info
    assert_response :success
  end

  test "should get speed" do
    get :speed
    assert_response :success
  end

  test "should get accelerate" do
    get :accelerate
    assert_response :success
  end

  test "should get brake" do
    get :brake
    assert_response :success
  end

  test "should get lights" do
    get :lights
    assert_response :success
  end

  test "should get parking_brake" do
    get :parking_brake
    assert_response :success
  end

end
