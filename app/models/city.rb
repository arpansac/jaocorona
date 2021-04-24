class City < ApplicationRecord
  has_many :hospital_beds
  has_many :plasma_donors
  has_many :oxygen_suppliers
  has_many :volunteers
  has_many :medicines

  default_scope {order(:state)}
end
