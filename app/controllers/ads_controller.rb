class AdsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :set_ad, only: [:show, :destroy, :edit, :update]

  def index
    if params[:category_id] && search_params[:category_id].present?
      @ads = Ad.where(category: search_params[:category_id])
    else
      @ads = Ad.all
    end


    # The `geocoded` scope filters only Ads with coordinates
    @markers = @ads.geocoded.map do |ad|
      {
        lat: ad.latitude,
        lng: ad.longitude
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.user = current_user
    if @ad.save
      redirect_to ad_path(@ad)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @ad.update(ad_params)
    redirect_to ad_path(@ad)
  end

  def destroy
    @ad.destroy
    redirect_to ads_path, status: :see_other
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:name, :category, :description, :price, :availability, :address, photos: [])
  end

  def search_params
    params.require(:category_id).permit(:category_id)
  end
end
