class PendingCommandsController < ApplicationController
  before_action :set_pending_command, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  # GET /pending_commands
  # GET /pending_commands.json
  def index
    @pending_commands = PendingCommand.all
  end

  # GET /pending_commands/1
  # GET /pending_commands/1.json
  def show
  end

  # GET /pending_commands/new
  def new
    @pending_command = PendingCommand.new
  end

  # GET /pending_commands/1/edit
  def edit
  end

  # POST /pending_commands
  # POST /pending_commands.json
  def create
    @pending_command = PendingCommand.new(pending_command_params)

    respond_to do |format|
      if @pending_command.save
        format.html { redirect_to @pending_command, notice: 'Pending command was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pending_command }
      else
        format.html { render action: 'new' }
        format.json { render json: @pending_command.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pending_commands/1
  # PATCH/PUT /pending_commands/1.json
  def update
    respond_to do |format|
      if @pending_command.update(pending_command_params)
        format.html { redirect_to @pending_command, notice: 'Pending command was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pending_command.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pending_commands/1
  # DELETE /pending_commands/1.json
  def destroy
    @pending_command.destroy
    respond_to do |format|
      format.html { redirect_to pending_commands_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pending_command
      @pending_command = PendingCommand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pending_command_params
      params.require(:pending_command).permit(:command, :device_id, :sent)
    end
end
