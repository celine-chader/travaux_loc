class AddUpdateDateToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :end_date, :date
    rename_column :bookings, :availability, :start_date
  end
end
