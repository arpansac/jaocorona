class HomeController < ApplicationController
  def home_page
    @plasma_donors = PlasmaDonor.active
    @hospital_beds = HospitalBed.active
    @oxygen_suppliers = OxygenSupplier.active
    @medicines = Medicine.active

    @external_links = ExternalLink.all.order('created_at asc')
  end


  def policies

  end
end
