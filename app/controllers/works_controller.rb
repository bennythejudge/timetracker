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
  
  #adding the "new" function - form and all that
  def new
    @work = Work.new
  end
  
  def create
    @work = Work.new(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours))
    if @work.save
      flash[:notice] = 'Work Added'
      redirect_to @work
    else
      render 'new'
    end
  end
  
  def edit
    # find the project to edit
    @work = Work.find(params[:id])
  end
  
  def update
    @work = Work.find(params[:id])
    # update it!
    if @work.update(params[:work].permit(:project_id, :user_id, :datetimeperformed, :hours))
       flash[:notice] = 'Work Updated'
       redirect_to @work
    else
       render 'edit'
    end    
  end
  
end
