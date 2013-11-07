require 'test_helper'

class TrackpointsControllerTest < ActionController::TestCase
  setup do
    @trackpoint = trackpoints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trackpoints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trackpoint" do
    assert_difference('Trackpoint.count') do
      post :create, trackpoint: { device_id: @trackpoint.device_id, elevation: @trackpoint.elevation, latitude: @trackpoint.latitude, longitude: @trackpoint.longitude, time: @trackpoint.time }
    end

    assert_redirected_to trackpoint_path(assigns(:trackpoint))
  end

  test "should show trackpoint" do
    get :show, id: @trackpoint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trackpoint
    assert_response :success
  end

  test "should update trackpoint" do
    patch :update, id: @trackpoint, trackpoint: { device_id: @trackpoint.device_id, elevation: @trackpoint.elevation, latitude: @trackpoint.latitude, longitude: @trackpoint.longitude, time: @trackpoint.time }
    assert_redirected_to trackpoint_path(assigns(:trackpoint))
  end

  test "should destroy trackpoint" do
    assert_difference('Trackpoint.count', -1) do
      delete :destroy, id: @trackpoint
    end

    assert_redirected_to trackpoints_path
  end
end
