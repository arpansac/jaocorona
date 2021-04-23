class HospitalBed < ApplicationRecord
  belongs_to :city

  def self.active
    return HospitalBed.where(
        fake: false,
        unavailable: false,
        ).order('created_at desc').count, HospitalBed.all.order('last_verified_at desc', 'created_at desc').first
  end

  def self.active_list
    return HospitalBed.where(
        fake: false,
        unavailable: false,
        ).order('created_at desc')
  end
end
