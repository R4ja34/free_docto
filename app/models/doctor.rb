class Doctor < ApplicationRecord
  belongs_to :city
  has_many :doctors_specialties
  has_many :specialties, through: :doctors_specialties
  has_many :appointments
  has_many :patients, through: :appointments
end
