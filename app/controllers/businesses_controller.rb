class BusinessesController < ApplicationController
  def index
    @businesses = Business.order(:id).page(params[:page]).per(50)
    set_link_headers(@businesses)
  end

  def show
    @business = Business.find(params[:id])
  end
end
