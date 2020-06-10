require 'rails_helper'

describe 'Course model', type: :model do
  it 'creates a valid course object' do
    instructor = Instructor.create(
      first_name: 'John',
      last_name: 'Doe',
      email: 'specinstructor@yopmail.com',
      password: '111111'
    )
    course = Course.new(
      title: "web dev 101",
      instructor_id: instructor.id
    )
    expect(course).to be_valid
  end

  it 'does not valid object creation without title and returns validation error' do
    instructor = Instructor.create(
      first_name: 'John',
      last_name: 'Doe',
      email: 'specinstructor@yopmail.com',
      password: '111111'
    )
    course = Course.new(
      instructor_id: instructor.id
    )
    expect(course).not_to be_valid
    expect(course.errors.message[:title]).to eq ['must exist']
  end

  it 'does not valid object creation with existing title and returns validation error' do
    instructor = Instructor.create(
      first_name: 'John',
      last_name: 'Doe',
      email: 'specinstructor@yopmail.com',
      password: '111111'
    )
    course_1 = Course.create(
      title: "web dev 101",
      instructor_id: instructor.id
    )
    course_2 = Course.new(
      title: "web Dev 101",
      instructor_id: instructor.id
    )
    expect(course_2).not_to be_valid
    expect(course_2.errors.message[:title]).to eq ['is already taken']

  end

  it 'does not valid object creation without instructor id and returns validation error' do
    course_1 = Course.new(
      title: "web dev 101",
    )
    expect(course_1).not_to be_valid
    expect(course_1.errors.message[:instructor_id]).to eq ['must exist']
  end
end
