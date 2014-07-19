class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
  # any @ variable is visibale from the views
  def show
    @company = Company.find(params[:id])
  end
end
