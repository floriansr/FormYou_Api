require 'faker'

PASSWORD = '111111'.freeze

puts 'Deleting previous records...'
Administrator.destroy_all
Instructor.destroy_all
Student.destroy_all
Category.destroy_all
Room.destroy_all

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
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "seededstudent#{n}@yopmail.com",
    password: PASSWORD
  )
  Category.create!(
    name: Faker::Educator.unique.subject,
    color_code: Faker::Color.unique.hex_color
  )
  Room.create!(
    name: "Room #{Faker::Movies::StarWars.unique.droid}"
  )
  n += 1
end

10.times do
  Course.create!(
    title: Faker::Educator.course_name,
    instructor: Instructor.all.sample
  )
end

10.times do 
  JoinTableCourseCategory.create(
    course: Course.all.sample,
    category: Category.all.sample
  )
end

puts "#{Administrator.count} admin profiles created."
puts "#{Instructor.count} instructors created."
puts "#{Student.count} students created."
puts "#{Course.count} courses created."
puts "#{Category.count} categories created."
puts "#{JoinTableCourseCategory.count} relations between courses and categories created."
puts "#{Room.count} rooms created."
