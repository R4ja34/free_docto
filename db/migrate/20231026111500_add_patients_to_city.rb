class AddPatientsToCity < ActiveRecord::Migration[7.1]
  def change
    add_reference :patients, :city, index: true, foreign_key: true
  end
end
