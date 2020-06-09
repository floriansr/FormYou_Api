require 'faker'

PASSWORD = '111111'.freeze

puts 'Deleting previous records...'

n = 1
3.times do

  Administrator.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "seededadministrator#{n}@yopmail.com",
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

10.times do
  Course.create!(
    title: Faker::Educator.course_name,
    instructor: Instructor.all.sample
  )
end

puts "#{Administrator.count} admin profiles created."
puts "#{Instructor.count} instructors created."
puts "#{Course.count} courses created."
