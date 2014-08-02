class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :is_user_admin, only: [:create, :new]
  
  def index
    @companies = Company.all.order('name')
  end
  # any @ variable is visibale from the views
  def show
    @company = Company.find(params[:id])
    # format depends on the request type
    # very powerful..
    respond_to do |format|
      format.html # just reply show html
      format.xml { render xml: @company}
      format.json { render json: @company}
    end
  end
  
  # create an empty @company
  def new
    @company = Company.new
  end
  
  
	def create
		@company = Company.new(params[:company].permit(:name))
    if @company.save
       flash[:notice] = 'Company Created'
       redirect_to @company
    else
       render 'new'
    end
	end
  
  
  def edit
    # find the company to edit
    @company = Company.find(params[:id])
  end  

  def update
    @company = Company.find(params[:id])
    # update it!
    if @company.update(params[:company].permit(:name))
       flash[:notice] = 'Company Updated'
       redirect_to @company
    else
       render 'edit'
    end    
  end
  
  
  def is_user_admin
    if current_user && current_user.admin_role
      puts "green light"
    else
      puts "red light"
      flash[:alert] = 'Only admins can add companies'
      @companies = Company.all
      render 'index'
    end
  end

end
