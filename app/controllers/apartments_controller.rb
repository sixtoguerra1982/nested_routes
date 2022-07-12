class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[ show edit update destroy ]
  before_action :set_building , only: [:show , :index , :new, :edit]
  before_action :collection_building , only: [:new , :edit]
  # GET /apartments or /apartments.json
  def index
    # @apartments = Apartment.all
    @apartments = @building.apartments
    # byebug
  end

  # GET /apartments/1 or /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments or /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      # byebug
      if @apartment.save
        format.html { redirect_to building_apartments_path(@apartment.building), notice: "Apartment was successfully created." }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1 or /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to building_apartments_path(@apartment.building), notice: "Apartment was successfully updated." }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1 or /apartments/1.json
  def destroy
    @apartment.destroy

    respond_to do |format|
      format.html { redirect_to building_apartments_path(@apartment.building), notice: "Apartment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def collection_building
      @buildings = Building.all
    end

    def set_building
      @building = Building.find(params[:building_id].to_i)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.require(:apartment).permit(:number, :building_id)
    end
end
