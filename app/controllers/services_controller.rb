class ServicesController < ApplicationController
  
  def index
    authorize! :read, :service
    @statuses = Daemons::Rails::Monitoring.statuses
  end
  
  def destroy
    authorize! :destroy, :service
    Daemons::Rails::Monitoring.stop(params[:id]+'.rb')
    redirect_to '/services'
  end
  
  def update
    authorize! :update, :service
    Daemons::Rails::Monitoring.start(params[:id]+'.rb')
    redirect_to '/services'
  end
  
end
