class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::RoutingError, with: :not_found
  rescue_from ActionController::UnknownController, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :bad_request

  def raise_not_found
    raise ActionController::RoutingError.new("No route matches #{params[:path]}")
  end

  private

    def bad_request(exception)
      render status: 400, json: exception
    end

    def not_found(exception)
      render status: 404, json: exception
    end
end
