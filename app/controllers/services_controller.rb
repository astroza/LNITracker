class ServicesController < ApplicationController
  def index
    @statuses = Daemons::Rails::Monitoring.statuses
  end
  
  def destroy
    Daemons::Rails::Monitoring.stop(params[:id]+'.rb')
    redirect_to '/services'
  end
  
  def update
    Daemons::Rails::Monitoring.start(params[:id]+'.rb')
    redirect_to '/services'
  end
  
end
