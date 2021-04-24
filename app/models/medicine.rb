class Medicine < ApplicationRecord
  belongs_to :city
  enum medicine_name: ["Remdesivir", "Fabiflu", "Favipiravir", "Tocilizumab"]

  def self.active
    return Medicine.where(
        fake: false,
        unavailable: false,
        ).order('created_at desc').count, Medicine.all.order('last_verified_at desc').first
  end

  def self.active_list
    return Medicine.where(
        fake: false,
        unavailable: false,
        ).order('created_at desc')
  end
end
