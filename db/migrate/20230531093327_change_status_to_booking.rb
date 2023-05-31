class ChangeStatusToBooking < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :status, from: false, to: nil
  end
end
