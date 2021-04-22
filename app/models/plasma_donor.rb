class PlasmaDonor < ApplicationRecord
  belongs_to :city

  enum blood_group: ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-", "Blood Bank"]


  def self.active
    return PlasmaDonor.where(
        fake: false,
        unavailable: false,
    ).order('created_at desc').count, PlasmaDonor.all.order('updated_at desc').first
  end
end
