class OxygenSupplier < ApplicationRecord
  belongs_to :city

  def self.active
    return OxygenSupplier.where(
        fake: false,
        unavailable: false,
        ).order('created_at desc').count, OxygenSupplier.all.order('last_verified_at desc').first
  end

  def self.active_list
    return OxygenSupplier.where(
        fake: false,
        unavailable: false,
        ).order('created_at desc')
  end
end
