class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @ads = current_user.ads
    @bookings = current_user.bookings
  end

end
