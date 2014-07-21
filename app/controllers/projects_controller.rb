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
    
  end
end
