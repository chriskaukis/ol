require 'test_helper'

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  test "should return a list of businesses" do
    get businesses_url
    json = JSON.parse(response.body)
    # If we add more fixtures test will still pass.
    assert json.size > 0
    json.each do |object|
      # We could test to make sure the bussiness exists and/or we could test
      # that the object returned contains all the attributes we expect.
      Business.find(object['id'])
    end
  end

  test "should return a business" do
    business = businesses(:one)
    get business_url(business)
    json = JSON.parse(response.body)
    # We could also test each attribute.
    assert json['id'] == business.id
  end
end
