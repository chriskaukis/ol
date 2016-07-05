require 'test_helper'

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  test 'should return a list of businesses' do
    get businesses_url
    json = JSON.parse(response.body)
    # If we add more fixtures test will still pass.
    assert json.size > 0
  end

  test 'should return a business' do
    business = businesses(:one)
    get business_url(business)
    json = JSON.parse(response.body)
    # We could also test each attribute.
    assert json['id'] == business.id
  end

  test 'should return not found' do
    get business_url('some id')
    assert_response :not_found
  end
end
