require 'rails_helper'

describe 'Instructor model', type: :model do
  it 'creates a valid but unvalidated admin object' do
    instructor = Instructor.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'specinstructor@yopmail.com',
      password: '111111'
    )
    expect(instructor).to be_valid
    puts instructor.validated
    expect(instructor.validated).to be false
  end

  it 'does not valid object creation without firstname and returns validation error' do
    instructor = Instructor.new(
      last_name: 'Doe',
      email: 'specinstructor@yopmail.com',
      password: '111111'
    )
    expect(instructor).not_to be_valid
  end

  it 'does not valid object creation without firstname and returns validation error' do
    instructor = Instructor.new(
      first_name: 'John',
      email: 'specinstructor@yopmail.com',
      password: '111111'
    )
    expect(instructor).not_to be_valid
  end
end