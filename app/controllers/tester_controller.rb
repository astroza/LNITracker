class TesterController < ApplicationController
    def create
      authorize! :create, :tester
      device_id = params[:device_id]
      velocity = params[:velocity]
      lng = params[:longitude]
      lat = params[:latitude]
      Trackpoint.create(:device_id => device_id, :latitude => lat, :longitude => lng, :velocity => velocity, :time => Time.now)
      respond_to do |format|
        format.html { render :text => "OK" }
      end
    end
    
    def show
      authorize! :read, :tester
    end
end
