json.businesses do
  json.array!(@businesses) do |business|
    json.partial! 'business', business: business
  end
end

json.links do
  json.partial! 'paginate', collection: @businesses
end
