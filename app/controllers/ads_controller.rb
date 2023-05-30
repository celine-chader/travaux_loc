class AdsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  before_action :set_ad, only: [:show, :destroy, :edit, :update]

  def index
    @ads = Ad.all
  end

  def show
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
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
    params.require(:ad).permit(:name, :category, :description, :availability, photos: [])
  end
end
