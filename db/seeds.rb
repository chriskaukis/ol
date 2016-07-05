# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

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
