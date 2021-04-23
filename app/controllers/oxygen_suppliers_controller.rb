class OxygenSuppliersController < ApplicationController
  before_action :set_oxygen_supplier, only: %i[ show edit update destroy update_unavailable update_fake update_last_verified_at ]
  before_action :volunteer_permission?, only: [:show, :edit, :update, :update_unavailable, :update_fake, :update_last_verified_at]
  before_action :admin_permission?, only: [:destroy]
  # GET /oxygen_suppliers or /oxygen_suppliers.json
  def index
    if (params[:city_id])
      @city = City.find(params[:city_id].to_i)
      @oxygen_suppliers = @city.oxygen_suppliers.active_list
    else
      @oxygen_suppliers = OxygenSupplier.active_list
    end
  end

  # GET /oxygen_suppliers/1 or /oxygen_suppliers/1.json
  def show
  end

  # GET /oxygen_suppliers/new
  def new
    @oxygen_supplier = OxygenSupplier.new
  end

  # GET /oxygen_suppliers/1/edit
  def edit
  end

  # POST /oxygen_suppliers or /oxygen_suppliers.json
  def create
    @oxygen_supplier = OxygenSupplier.new(oxygen_supplier_params)

    respond_to do |format|
      if @oxygen_supplier.save
        format.html { redirect_to oxygen_suppliers_url, notice: "Oxygen supplier was successfully created." }
        format.json { render :show, status: :created, location: @oxygen_supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oxygen_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oxygen_suppliers/1 or /oxygen_suppliers/1.json
  def update
    respond_to do |format|
      if @oxygen_supplier.update(oxygen_supplier_params)
        format.html { redirect_to oxygen_suppliers_url, notice: "Oxygen supplier was successfully updated." }
        format.json { render :show, status: :ok, location: @oxygen_supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oxygen_supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_last_verified_at
    @oxygen_supplier.update(last_verified_at: Time.now)
  end

  def update_fake
    @oxygen_supplier.update(fake: params[:fake])
  end


  def update_unavailable
    @oxygen_supplier.update(unavailable: params[:unavailable])
  end

  # DELETE /oxygen_suppliers/1 or /oxygen_suppliers/1.json
  def destroy
    @oxygen_supplier.destroy
    respond_to do |format|
      format.html { redirect_to oxygen_suppliers_url, notice: "Oxygen supplier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oxygen_supplier
      @oxygen_supplier = OxygenSupplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oxygen_supplier_params
      params.require(:oxygen_supplier).permit(:name, :phone, :alternate_phone, :city_id, :disclaimer)
    end
end
