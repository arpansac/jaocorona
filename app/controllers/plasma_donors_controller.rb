class PlasmaDonorsController < ApplicationController
  before_action :set_plasma_donor, only: %i[ show edit update destroy update_unavailable update_fake update_last_verified_at ]
  before_action :volunteer_permission?, only: [:show, :edit, :update, :update_unavailable, :update_fake, :update_last_verified_at]
  before_action :admin_permission?, only: [:destroy]
  # GET /plasma_donors or /plasma_donors.json
  def index
    if (params[:city_id])
      @city = City.find(params[:city_id].to_i)
      @plasma_donors = @city.plasma_donors.active_list
    else
      @plasma_donors = PlasmaDonor.active_list
    end
  end

  # GET /plasma_donors/1 or /plasma_donors/1.json
  def show
  end

  # GET /plasma_donors/new
  def new
    @plasma_donor = PlasmaDonor.new
  end

  # GET /plasma_donors/1/edit
  def edit
  end

  # POST /plasma_donors or /plasma_donors.json
  def create
    @plasma_donor = PlasmaDonor.new(plasma_donor_params)

    respond_to do |format|
      if @plasma_donor.save
        format.html { redirect_to plasma_donors_url, notice: "Plasma donor was successfully created." }
        format.json { render :show, status: :created, location: @plasma_donor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plasma_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plasma_donors/1 or /plasma_donors/1.json
  def update
    respond_to do |format|
      if @plasma_donor.update(plasma_donor_params)
        format.html { redirect_to plasma_donors_url, notice: "Plasma donor was successfully updated." }
        format.json { render :show, status: :ok, location: @plasma_donor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plasma_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_last_verified_at
    @plasma_donor.update(last_verified_at: Time.now)
  end


  def update_fake
    @plasma_donor.update(fake: params[:fake])
  end


  def update_unavailable
    @plasma_donor.update(unavailable: params[:unavailable])
  end

  # DELETE /plasma_donors/1 or /plasma_donors/1.json
  def destroy
    @plasma_donor.destroy
    respond_to do |format|
      format.html { redirect_to plasma_donors_url, notice: "Plasma donor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plasma_donor
      @plasma_donor = PlasmaDonor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plasma_donor_params
      params.require(:plasma_donor).permit(:name, :phone, :alternate_phone, :blood_group, :city_id, :pincode, :covid_cured_at, :disclaimer)
    end
end
