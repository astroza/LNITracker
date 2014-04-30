class BusStopsController < ApplicationController
  before_action :set_bus_stop, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource :except => [:show, :index]
  skip_load_resource :only => [:create]

  # GET /bus_stops
  # GET /bus_stops.json
  def index
    @bus_stops = BusStop.all
    respond_to do |format|
        format.json # { render json: @bus_stops, callback: params[:callback] }
        format.html
    end
  end

  # GET /bus_stops/1
  # GET /bus_stops/1.json
  def show
  end

  # GET /bus_stops/new
  def new
    @bus_stop = BusStop.new
  end

  # GET /bus_stops/1/edit
  def edit
  end

  # POST /bus_stops
  # POST /bus_stops.json
  def create
    @bus_stop = BusStop.new(bus_stop_params)

    respond_to do |format|
      if @bus_stop.save
        format.html { redirect_to @bus_stop, notice: 'Bus stop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bus_stop }
      else
        format.html { render action: 'new' }
        format.json { render json: @bus_stop.errors, status: :unprocessable_entity, callback: params['callback'] }
      end
    end
  end

  # PATCH/PUT /bus_stops/1
  # PATCH/PUT /bus_stops/1.json
  def update
    respond_to do |format|
      if @bus_stop.update(bus_stop_params)
        format.html { redirect_to @bus_stop, notice: 'Bus stop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bus_stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_stops/1
  # DELETE /bus_stops/1.json
  def destroy
    @bus_stop.destroy
    respond_to do |format|
      format.html { redirect_to bus_stops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_stop
      @bus_stop = BusStop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_stop_params
      params.require(:bus_stop).permit(:name, :latitude, :longitude)
    end
end
