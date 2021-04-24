class MedicinesController < ApplicationController
  before_action :set_medicine, only: %i[ show edit update destroy update_unavailable update_fake update_last_verified_at ]
  before_action :volunteer_permission?, only: [:show, :edit, :update, :update_unavailable, :update_fake, :update_last_verified_at]
  before_action :admin_permission?, only: [:destroy]
  # GET /medicines or /medicines.json
  def index
    if (params[:city_id])
      @city = City.find(params[:city_id].to_i)
      @medicines = @city.medicines.active_list
    else
      @medicines = Medicine.active_list
    end
  end

  # GET /medicines/1 or /medicines/1.json
  def show
  end

  # GET /medicines/new
  def new
    @medicine = Medicine.new
  end

  # GET /medicines/1/edit
  def edit
  end

  # POST /medicines or /medicines.json
  def create
    @medicine = Medicine.new(medicine_params)

    respond_to do |format|
      if @medicine.save
        format.html { redirect_to medicines_url, notice: "Medicine was successfully created." }
        format.json { render :show, status: :created, location: @medicine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicines/1 or /medicines/1.json
  def update
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to hospital_beds_url, notice: "Medicine was successfully updated." }
        format.json { render :show, status: :ok, location: @medicine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicines/1 or /medicines/1.json
  def destroy
    @medicine.destroy
    respond_to do |format|
      format.html { redirect_to medicines_url, notice: "Medicine was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def update_last_verified_at
    @medicine.update(last_verified_at: Time.now)
  end


  def update_fake
    @medicine.update(fake: params[:fake])
  end


  def update_unavailable
    @medicine.update(unavailable: params[:unavailable])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @medicine = Medicine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medicine_params
      params.require(:medicine).permit(:medicine_name, :phone, :address, :alternate_phone, :city_id)
    end
end
