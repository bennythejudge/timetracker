class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
  # any @ variable is visibale from the views
  def show
    @company = Company.find(params[:id])
    # format depends on the request type
    # very powerful..
    # respond_to do |format|
    #   format.html # just reply show html
    #   format.xml { render xml: @company}
    #   format.json { render json: @company}
    # end
  end
  def new
  end
  
end
