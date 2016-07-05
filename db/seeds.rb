require 'csv'

# NOTE: This is slow. A better way to handle this to leverage bulk insert if
# the database supports it. Be careful though and make sure to escape all
# necessary data and handle date formatting which ActiveRecord handles for us.
CSV.foreach(File.join(File.expand_path(File.dirname(__FILE__)), 'seeds.csv'), headers: true) do |row|
  Business.find_or_create_by!(uuid: row['uuid']) do |business|
    business.name = row['name']
    business.address = row['address']
    business.address2 = row['address2']
    business.city = row['city']
    business.state = row['state']
    business.zip = row['zip']
    business.country = row['country']
    business.phone = row['phone']
    business.website = row['website']
    business.created_at = row['created_at']
    business.updated_at = row['created_at']
  end
end
