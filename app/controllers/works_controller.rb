class WorksController < ApplicationController
  def index
    if ( params[:days] )
      @works = Work.recentdays(params[:days]).order('datetimeperformed desc')
    @works = Work.all
  end
  # any @ variable is visibale from the views
  def show
    @work = Work.find(params[:id])
  end
end
