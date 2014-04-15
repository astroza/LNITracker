class TrackpointsController < ApplicationController
  before_action :set_trackpoint, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /trackpoints
  # GET /trackpoints.json
  def index
    if params['limit'] != nil
    	@trackpoints = Trackpoint.where(:device_id => params[:device_id]).limit(params[:limit]).order(time: :desc)
    else
        @trackpoints = Trackpoint.where(:device_id => params[:device_id]).limit(100).order(time: :desc)
    end

    # Counter de solicitudes
    DailyCounter.get_counter(params[:device_id]).increment!(:counter)

    respond_to do |format|
        format.json { render json: @trackpoints, callback: params[:callback] }
        format.html
    end
  end

  # GET /trackpoints/1
  # GET /trackpoints/1.json
  def show
  end

  # GET /trackpoints/new
  def new
    @trackpoint = Trackpoint.new
  end

  # GET /trackpoints/1/edit
  def edit
  end

  # POST /trackpoints
  # POST /trackpoints.json
  def create
    @trackpoint = Trackpoint.new(trackpoint_params)

    respond_to do |format|
      if @trackpoint.save
        format.html { redirect_to @trackpoint, notice: 'Trackpoint was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trackpoint }
      else
        format.html { render action: 'new' }
        format.json { render json: @trackpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackpoints/1
  # PATCH/PUT /trackpoints/1.json
  def update
    respond_to do |format|
      if @trackpoint.update(trackpoint_params)
        format.html { redirect_to @trackpoint, notice: 'Trackpoint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trackpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackpoints/1
  # DELETE /trackpoints/1.json
  def destroy
    @trackpoint.destroy
    respond_to do |format|
      format.html { redirect_to trackpoints_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trackpoint
      @trackpoint = Trackpoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trackpoint_params
      params.require(:trackpoint).permit(:device_id, :latitude, :longitude, :elevation, :time)
    end
end
