class Business < ApplicationRecord
  validates :uuid, :name, presence: true
end
