class AddDoctorsToCity < ActiveRecord::Migration[7.1]
  def change
    add_reference :doctors, :city, index: true, foreign_key: true
  end
end
