class WorksController < ApplicationController
  def index
    # if i get the :days parameter then show only the recentdays works
    if ( params[:days] )
      @works = Work.recentdays(params[:days]).order('datetimeperformed desc')
    else
      @works = Work.all.order('datetimeperformed desc')
    end
  end
  # any @ variable is visibale from the views
  def show
    @work = Work.find(params[:id])
  end
end
