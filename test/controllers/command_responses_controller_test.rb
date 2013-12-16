require 'test_helper'

class CommandResponsesControllerTest < ActionController::TestCase
  setup do
    @command_response = command_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:command_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create command_response" do
    assert_difference('CommandResponse.count') do
      post :create, command_response: { device_id: @command_response.device_id, response: @command_response.response }
    end

    assert_redirected_to command_response_path(assigns(:command_response))
  end

  test "should show command_response" do
    get :show, id: @command_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @command_response
    assert_response :success
  end

  test "should update command_response" do
    patch :update, id: @command_response, command_response: { device_id: @command_response.device_id, response: @command_response.response }
    assert_redirected_to command_response_path(assigns(:command_response))
  end

  test "should destroy command_response" do
    assert_difference('CommandResponse.count', -1) do
      delete :destroy, id: @command_response
    end

    assert_redirected_to command_responses_path
  end
end
