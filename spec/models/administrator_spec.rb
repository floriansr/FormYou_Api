require 'rails_helper'

describe 'Administrator model', type: :model do
  it 'creates a valid but unvalidated admin object' do
    admin = Administrator.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'specadmin@yopmail.com',
      password: '111111'
    )
    expect(admin).to be_valid
    expect(admin.validated).to be false
  end

  it 'does not valid object creation without firstname and returns validation error' do
    admin = Administrator.new(
      last_name: 'Doe',
      email: 'specadmin@yopmail.com',
      password: '111111'
    )
    expect(admin).not_to be_valid
  end

  it 'does not valid object creation without firstname and returns validation error' do
    admin = Administrator.new(
      first_name: 'John',
      email: 'specadmin@yopmail.com',
      password: '111111'
    )
    expect(admin).not_to be_valid
  end
end
