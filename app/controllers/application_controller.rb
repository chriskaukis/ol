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

    def set_link_headers(paged)
      links = {}
      links[:first] = 1 if paged.total_pages > 1 && !paged.first_page?
      links[:last] = paged.total_pages if paged.total_pages > 1 && !paged.last_page?
      links[:next] = paged.next_page if !paged.last_page? && !paged.out_of_range?
      links[:prev] = paged.prev_page if !paged.first_page? && !paged.out_of_range?

      link_headers = []
      links.each do |key, value|
        link_headers << %Q{<#{url_for(request.query_parameters.merge({ page: value }))}>; rel="#{key}"}
      end
      headers['Link'] = link_headers.join(', ')
    end
end
