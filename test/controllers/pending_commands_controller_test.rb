require 'test_helper'

class PendingCommandsControllerTest < ActionController::TestCase
  setup do
    @pending_command = pending_commands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pending_commands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pending_command" do
    assert_difference('PendingCommand.count') do
      post :create, pending_command: { command: @pending_command.command, device_id: @pending_command.device_id }
    end

    assert_redirected_to pending_command_path(assigns(:pending_command))
  end

  test "should show pending_command" do
    get :show, id: @pending_command
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pending_command
    assert_response :success
  end

  test "should update pending_command" do
    patch :update, id: @pending_command, pending_command: { command: @pending_command.command, device_id: @pending_command.device_id }
    assert_redirected_to pending_command_path(assigns(:pending_command))
  end

  test "should destroy pending_command" do
    assert_difference('PendingCommand.count', -1) do
      delete :destroy, id: @pending_command
    end

    assert_redirected_to pending_commands_path
  end
end
