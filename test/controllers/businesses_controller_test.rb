require 'test_helper'

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  test 'should return a list of businesses' do
    get businesses_url, as: :json
    json = JSON.parse(response.body)
    # If we add more fixtures test will still pass.
    assert json.size > 0
  end

  test 'should return link headers' do
    get businesses_url
    assert response.headers.has_key?('Link')
  end

  test 'should contain pagination links metadata' do
    get businesses_url
    json = JSON.parse(response.body)
    assert json.has_key?('links')
  end

  test 'should return a business' do
    business = businesses(:business_1)
    get business_url(business), as: :json
    json = JSON.parse(response.body)
    # We could also test each attribute.
    assert json['id'] == business.id
  end

  test 'should return not found' do
    get business_url('some id'), as: :json
    assert_response :not_found
  end
end
