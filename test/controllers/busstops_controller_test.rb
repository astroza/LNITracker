require 'test_helper'

class BusstopsControllerTest < ActionController::TestCase
  setup do
    @busstop = busstops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:busstops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create busstop" do
    assert_difference('Busstop.count') do
      post :create, busstop: { latitude: @busstop.latitude, longitude: @busstop.longitude, name: @busstop.name }
    end

    assert_redirected_to busstop_path(assigns(:busstop))
  end

  test "should show busstop" do
    get :show, id: @busstop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @busstop
    assert_response :success
  end

  test "should update busstop" do
    patch :update, id: @busstop, busstop: { latitude: @busstop.latitude, longitude: @busstop.longitude, name: @busstop.name }
    assert_redirected_to busstop_path(assigns(:busstop))
  end

  test "should destroy busstop" do
    assert_difference('Busstop.count', -1) do
      delete :destroy, id: @busstop
    end

    assert_redirected_to busstops_path
  end
end
