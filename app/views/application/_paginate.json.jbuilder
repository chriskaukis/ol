# Parameters:
#   collection: Paginated collection object.
# ???: This could possibly cleaned up using a helper or view model possibly to
# clean up and make more maintainable and configurable.
json.self url_for(request.query_parameters.merge({ page: collection.current_page, only_path: false }))
json.first url_for(request.query_parameters.merge({ page: 1, only_path: false })) if collection.total_pages > 1 && !collection.first_page?
json.last url_for(request.query_parameters.merge({ page: collection.total_pages, only_path: false })) if collection.total_pages > 1 && !collection.last_page?
json.next url_for(request.query_parameters.merge({ page: collection.next_page, only_path: false })) if !collection.last_page? && !collection.out_of_range?
json.prev url_for(request.query_parameters.merge({ page: collection.prev_page, only_path: false })) if !collection.first_page? && !collection.out_of_range?
