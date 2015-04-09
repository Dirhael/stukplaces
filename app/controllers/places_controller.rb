class PlacesController < ApplicationController
  before_action :authenticate_user!, only [:new, :edit, :update, :destroy, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.new(place_params)

    if @place.save
      redirect_to @place, notice: 'Place successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Place successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path, notice: 'Place successfully destroyed'
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :address, :phone, :website, :description, :user_id)
  end

end
