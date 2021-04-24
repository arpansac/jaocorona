class Medicine < ApplicationRecord
  belongs_to :city

  def self.active
    return Medicine.where(
        fake: false,
        unavailable: false,
        ).order('created_at desc').count, Medicine.all.order('last_verified_at desc', 'created_at desc').first
  end

  def self.active_list
    return Medicine.where(
        fake: false,
        unavailable: false,
        ).order('created_at desc')
  end
end
