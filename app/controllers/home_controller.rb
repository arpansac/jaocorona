class HomeController < ApplicationController
  def home_page
    @plasma_donors = PlasmaDonor.active
    @hospital_beds = HospitalBed.active
    @oxygen_suppliers = OxygenSupplier.active
  end
end
