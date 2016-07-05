class BusinessesController < ApplicationController
  def index
    businesses = Business.order(:id).page(params[:page]).per(50)
    render json: businesses
  end

  def show
    business = Business.find(params[:id])
    render json: business
  end
end
