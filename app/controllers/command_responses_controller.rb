class CommandResponsesController < ApplicationController
  before_action :set_command_response, only: [:show, :edit, :update, :destroy]

  # GET /command_responses
  # GET /command_responses.json
  def index
    @command_responses = CommandResponse.all
  end

  # GET /command_responses/1
  # GET /command_responses/1.json
  def show
  end

  # GET /command_responses/new
  def new
    @command_response = CommandResponse.new
  end

  # GET /command_responses/1/edit
  def edit
  end

  # POST /command_responses
  # POST /command_responses.json
  def create
    @command_response = CommandResponse.new(command_response_params)

    respond_to do |format|
      if @command_response.save
        format.html { redirect_to @command_response, notice: 'Command response was successfully created.' }
        format.json { render action: 'show', status: :created, location: @command_response }
      else
        format.html { render action: 'new' }
        format.json { render json: @command_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /command_responses/1
  # PATCH/PUT /command_responses/1.json
  def update
    respond_to do |format|
      if @command_response.update(command_response_params)
        format.html { redirect_to @command_response, notice: 'Command response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @command_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /command_responses/1
  # DELETE /command_responses/1.json
  def destroy
    @command_response.destroy
    respond_to do |format|
      format.html { redirect_to command_responses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_command_response
      @command_response = CommandResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def command_response_params
      params.require(:command_response).permit(:response, :device_id)
    end
end
