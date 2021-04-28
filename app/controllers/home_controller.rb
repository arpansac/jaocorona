class HomeController < ApplicationController
  def home_page
    @plasma_donors = PlasmaDonor.active
    @hospital_beds = HospitalBed.active
    @oxygen_suppliers = OxygenSupplier.active
    @medicines = Medicine.active


    if params[:city_id]
      @external_links = City.find(params[:city_id]).external_links.order('created_at asc')
    else
      @external_links = ExternalLink.all.order('created_at asc')
    end

  end


  def policies

  end

  def version

  end

end
