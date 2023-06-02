class AdsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :set_ad, only: [:show, :destroy, :edit, :update]

  def index

    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @ads = Ad.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:search][:category].present?
      @ads = Ad.where(category: params[:search][:category])
    else
      @ads = Ad.all
    end

    # The `geocoded` scope filters only Ads with coordinates
    @markers = @ads.geocoded.map do |ad|
      {
        lat: ad.latitude,
        lng: ad.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {ad: ad}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @booking = Booking.new
    @marker = {
      lat: @ad.latitude,
      lng: @ad.longitude
    }
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
