# app/controllers/flats_controller.rb
class FlatsController < ApplicationController
  before_action :set_flat, only: [ :show, :edit, :update, :destroy ]

  # app/controllers/flats_controller.rb
  def index
    if params[:query].present?
      # Filters flats where the name contains the search term (case-insensitive on PostgreSQL/SQLite)
      @flats = Flat.where("name LIKE ?", "%#{params[:query]}%")
    else
      # Displays everything if no search query is provided
      @flats = Flat.all
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
