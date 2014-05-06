class DailyCountersController < ApplicationController
  before_action :set_daily_counter, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource :except => [:show, :index]
  skip_load_resource :only => [:create]

  # GET /daily_counters
  # GET /daily_counters.json
  def index
    @daily_counters = DailyCounter.all
  end

  # GET /daily_counters/1
  # GET /daily_counters/1.json
  def show
  end

  # GET /daily_counters/new
  def new
    @daily_counter = DailyCounter.new
  end

  # GET /daily_counters/1/edit
  def edit
  end

  # POST /daily_counters
  # POST /daily_counters.json
  def create
    @daily_counter = DailyCounter.new(daily_counter_params)

    respond_to do |format|
      if @daily_counter.save
        format.html { redirect_to @daily_counter, notice: 'Daily counter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @daily_counter }
      else
        format.html { render action: 'new' }
        format.json { render json: @daily_counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_counters/1
  # PATCH/PUT /daily_counters/1.json
  def update
    respond_to do |format|
      if @daily_counter.update(daily_counter_params)
        format.html { redirect_to @daily_counter, notice: 'Daily counter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @daily_counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_counters/1
  # DELETE /daily_counters/1.json
  def destroy
    @daily_counter.destroy
    respond_to do |format|
      format.html { redirect_to daily_counters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_counter
      @daily_counter = DailyCounter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_counter_params
      params.require(:daily_counter).permit(:device_id, :date, :counter)
    end
end
