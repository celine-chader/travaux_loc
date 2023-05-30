class BookingsController < ApplicationController
  def new
    @booking = Booking.new
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

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to "/dashboard"
  end

  private

  def booking_params
    params.require(:booking).permit(:availability)
  end
end
