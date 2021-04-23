class HospitalBedsController < ApplicationController
  before_action :set_hospital_bed, only: %i[ show edit update destroy update_unavailable update_fake update_last_verified_at ]
  before_action :volunteer_permission?, only: [:show, :edit, :update, :update_unavailable, :update_fake, :update_last_verified_at]
  before_action :admin_permission?, only: [:destroy]
  # GET /hospital_beds or /hospital_beds.json
  def index

    if (params[:city_id])
      @city = City.find(params[:city_id].to_i)
      @hospital_beds = @city.hospital_beds.active_list
    else
      @hospital_beds = HospitalBed.active_list
    end
  end

  # GET /hospital_beds/1 or /hospital_beds/1.json
  def show
  end

  # GET /hospital_beds/new
  def new
    @hospital_bed = HospitalBed.new
  end

  # GET /hospital_beds/1/edit
  def edit
  end

  # POST /hospital_beds or /hospital_beds.json
  def create
    @hospital_bed = HospitalBed.new(hospital_bed_params)

    respond_to do |format|
      if @hospital_bed.save
        format.html { redirect_to hospital_beds_url, notice: "Hospital bed was successfully created." }
        format.json { render :show, status: :created, location: @hospital_bed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hospital_bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospital_beds/1 or /hospital_beds/1.json
  def update
    respond_to do |format|
      if @hospital_bed.update(hospital_bed_params)
        format.html { redirect_to hospital_beds_url, notice: "Hospital bed was successfully updated." }
        format.json { render :show, status: :ok, location: @hospital_bed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hospital_bed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_last_verified_at
    @hospital_bed.update(last_verified_at: Time.now)
  end


  def update_fake
    @hospital_bed.update(fake: params[:fake])
  end


  def update_unavailable
    @hospital_bed.update(unavailable: params[:unavailable])
  end


  # DELETE /hospital_beds/1 or /hospital_beds/1.json
  def destroy
    @hospital_bed.destroy
    respond_to do |format|
      format.html { redirect_to hospital_beds_url, notice: "Hospital bed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_bed
      @hospital_bed = HospitalBed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hospital_bed_params
      params.require(:hospital_bed).permit(:hospital_name, :contact_name, :phone, :alternate_phone, :address, :city_id, :icu_beds, :beds, :disclaimer)
    end
end
