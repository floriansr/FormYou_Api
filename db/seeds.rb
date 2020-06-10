require 'faker'

PASSWORD = '111111'.freeze

Administrator.destroy_all
Instructor.destroy_all

puts 'Clearing previous records...'

n = 1
3.times do
  Administrator.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "seededadmin#{n}@yopmail.com",
    password: PASSWORD
  )

  Instructor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "seededinstructor#{n}@yopmail.com",
    password: PASSWORD
  )

  n += 1
end

puts "#{Administrator.count} admin profiles created."
puts "#{Instructor.count} instructors created."
