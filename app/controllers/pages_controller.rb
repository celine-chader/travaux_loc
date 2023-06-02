class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @ads = current_user.ads
    @sort_bookings = Booking.joins(:ad).order(status: :desc).where(user: current_user)
    @pending_bookings = []
    @bookings = current_user.bookings
  end

end
