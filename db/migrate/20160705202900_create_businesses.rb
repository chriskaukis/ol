class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :uuid, null: false, index: true, unique: true
      t.string :name, null: false, index: true
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :website
      t.timestamps
    end
  end
end
