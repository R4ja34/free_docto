# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Créez 10 médecins
require 'faker'

DoctorsSpecialty.destroy_all
Appointment.destroy_all
Patient.destroy_all
Doctor.destroy_all
Specialty.destroy_all
City.destroy_all


city_names = ["Paris", "Marseille", "Toulouse", "Montpellier"]

city_names.each do |name|
  City.create(name: name)
end

specialties = ["allergologie", "anesthésie", "cardiologie", "dermatologie", "gériatrie", "gynécologie", "hématologie"]

specialties.each do |name|
  Specialty.create(name: name)
end

5.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.all.sample.id
  )
end

15.times do
  patient = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.all.sample.id
    )
  end
  
  puts "si ca marche dit wouhou1"

doctors = Doctor.all
patients = Patient.all

doctors.each do |doctor|
  num_specialties = rand(1..3)
  speciality_array = specialties.shuffle.take(num_specialties)
  speciality_array.each do |speciality_name|
    speciality = Specialty.find_by(name: speciality_name)
    DoctorsSpecialty.create(doctor: doctor, specialty: speciality)
  end
end

30.times do
  # Sélectionnez un médecin et un patient dans la même ville
  doctor = doctors.sample
  patient = patients.select { |p| p.city_id == doctor.city_id }.sample
  if doctor && patient
    city = City.find(doctor.city_id)
    date = Faker::Time.between_dates(from: Date.today, to: 1.year.from_now, period: :all)
    appointment = Appointment.create(doctor: doctor, patient: patient, city: city, date: date)
  end
end

  # 30.times do
  #   doctor = Doctor.all.sample.id
  #   puts ("essaie 1:#{doctor}")
  #   patient = Patient.all.sample.id
  #   puts ("essaie 2:#{patient}")
  #   city = City.all.sample.id
  #   date = Faker::Time.between_dates(from: Date.today, to: 1.year.from_now, period: :all)
    
  #   Appointment.create(doctor_id: doctor, patient_id: patient, city_id: city, date: date)
  # end
  puts "si ca marche dit wouhou2"
  
  # Doctor.all.each do |doctor|
  #   rand = rand(1..3)
  #   speciality_array = specialties.dup
  #   rand.times do
  #     speciality_rand=speciality_array.sample
  #     speciality_array.delete(speciality_rand)
  #     speciality=Specialty.find_by(name: speciality_rand).id
  #     DoctorsSpecialty.create(doctor_id: doctor.id, specialty_id: speciality)
  #   end
  # end