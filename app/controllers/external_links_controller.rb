class ExternalLinksController < ApplicationController
  before_action :set_external_link, only: %i[ destroy  ]
  before_action :authenticate_user!, only: [:destroy, :new, :create]
  # GET /external_links or /external_links.json
  # def index
  #   @external_links = ExternalLink.all
  # end


  def index_table
    @city_id = params[:city_id]
    if @city_id
      @external_links = City.find(params[:city_id]).external_links.order('created_at asc')
    else
      @external_links = ExternalLink.all.order('created_at asc')
    end
  end
  #
  # GET /external_links/1 or /external_links/1.json
  # def show
  # end
  #
  # GET /external_links/new
  def new
    @external_link = ExternalLink.new
  end

  # # GET /external_links/1/edit
  # def edit
  # end

  # POST /external_links or /external_links.json
  def create
    @external_link = ExternalLink.new(external_link_params)

    err = false


    begin

      object = LinkThumbnailer.generate(external_link_params[:url])

      @external_link.title = object.title

      if (@external_link.description.blank?)
        @external_link.description = object.description
      end
      @external_link.favicon = object.favicon
    rescue => err
      error = true
    end

    respond_to do |format|
      if !error && @external_link.save
        format.html { redirect_to root_path, notice: "External link was successfully created." }
        format.json { render :show, status: :created, location: @external_link }
      else
        format.html { render :new, status: :unprocessable_entity, notice: "Please enter a complete link" }
        format.json { render json: @external_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /external_links/1 or /external_links/1.json
  # def update
  #   respond_to do |format|
  #     if @external_link.update(external_link_params)
  #       format.html { redirect_to @external_link, notice: "External link was successfully updated." }
  #       format.json { render :show, status: :ok, location: @external_link }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @external_link.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /external_links/1 or /external_links/1.json
  def destroy
    @external_link.destroy
    respond_to do |format|
      format.html { redirect_to external_links_url, notice: "External link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_link
      @external_link = ExternalLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def external_link_params
      params.require(:external_link).permit(:url, :description, :city_id)
    end
end
