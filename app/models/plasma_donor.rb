class PlasmaDonor < ApplicationRecord
  belongs_to :city

  enum blood_group: ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-", "Blood Bank", "All Blood Groups"]

  # this gets the aggregated count and the last updated
  def self.active
    return PlasmaDonor.where(
        fake: false,
        unavailable: false,
    ).order('created_at desc').count, PlasmaDonor.all.order('updated_at desc').first
  end


  def self.active_list
    return PlasmaDonor.where(
        fake: false,
        unavailable: false,
        ).order('created_at desc')
  end
end
