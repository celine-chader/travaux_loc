class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  def new
    @booking = Booking.new
    @ad = Ad.find(params[:ad_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @ad = Ad.find(params[:ad_id])
    @booking.user = current_user
    @booking.ad = @ad
    if @booking.save
      redirect_to dashboard_path
    else
      render "/ads/show", status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: true)
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: false)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
