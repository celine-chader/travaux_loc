class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @ads = current_user.ads
    @sort_bookings = current_user.requested
    @pending_sort_bookings = @sort_bookings.select { |b| b.status == nil }
    @pending_bookings = []
    @bookings = current_user.bookings
  end

end
