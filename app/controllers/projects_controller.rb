class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  # any @ variable is visibale from the views
  def show
    @project = Project.find(params[:id])
  end
end
