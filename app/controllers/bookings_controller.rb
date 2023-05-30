class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  def new
    @booking = Booking.new
    @ad = Ad.find(params[:ad_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(params[:user_id])
    @ad = Ad.find(params[:ad_id])
    @booking.user = @user
    @booking.ad = @ad
    if @booking.save
      redirect_to ad_path(@ad)
    else
      render "/ads/show", status: :unprocessable_entity
    end
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  # end

  # def update
  #   @booking = Booking.find(params[:id])
  #   @booking.update(booking_params)
  #   redirect_to
  # end

  private

  def booking_params
    params.require(:booking).permit(:availability)
  end
end
