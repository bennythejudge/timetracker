class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  # any @ variable is visibale from the views
  def show
    puts "inside projects controller"
    if (params[:slug])
      @project = Project.find_by slug: params[:slug]
    else
      @project = Project.find(params[:id])
    end
  end
  def new
    @project = Project.new   
  end
  
  def create
    @project = Project.new(params[:project].permit(:name, :slug, :company_id, :default_rate))
    if @project.save
      flash[:notice] = 'Project Added'
      redirect_to @project
    else
      render 'new'
    end
  end

  
end
