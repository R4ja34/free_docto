class AddAppointmentsToCity < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :city, index: true, foreign_key: true
  end
end
