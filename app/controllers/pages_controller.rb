class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @ads = current_user.ads
    requests = Booking.select { |booking| booking.ad.user == current_user }
    @pending_requests = requests.select { |request| request.status == nil }
    @bookings = current_user.bookings
  end

end
