require 'test_helper'

class DailyCountersControllerTest < ActionController::TestCase
  setup do
    @daily_counter = daily_counters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_counters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_counter" do
    assert_difference('DailyCounter.count') do
      post :create, daily_counter: { counter: @daily_counter.counter, date: @daily_counter.date, device_id: @daily_counter.device_id }
    end

    assert_redirected_to daily_counter_path(assigns(:daily_counter))
  end

  test "should show daily_counter" do
    get :show, id: @daily_counter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_counter
    assert_response :success
  end

  test "should update daily_counter" do
    patch :update, id: @daily_counter, daily_counter: { counter: @daily_counter.counter, date: @daily_counter.date, device_id: @daily_counter.device_id }
    assert_redirected_to daily_counter_path(assigns(:daily_counter))
  end

  test "should destroy daily_counter" do
    assert_difference('DailyCounter.count', -1) do
      delete :destroy, id: @daily_counter
    end

    assert_redirected_to daily_counters_path
  end
end
