require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'should test that the factory is valid' do
    expect(FactoryBot.build :employee).to be_valid
  end

  it 'should validate the presence of the active attribute value' do
    employee = FactoryBot.build :employee, google_user_id: ''
  expect(employee).not_to be_valid
  expect(employee.errors.messages[:google_user_id]).to include("can't be blank")
end

  it 'should validate the presence of the name attribute value' do
    employee = FactoryBot.build :employee, first_name: ''
    expect(employee).not_to be_valid
    expect(employee.errors.messages[:first_name]).to include("can't be blank")
  end

  it 'should validate the presence of the lead attribute value' do
    employee = FactoryBot.build :employee, last_name: ''
    expect(employee).not_to be_valid
    expect(employee.errors.messages[:last_name]).to include("can't be blank")
  end
    it 'should validate the presence of the active attribute value' do
      employee = FactoryBot.build :employee, email: ''
    expect(employee).not_to be_valid
    expect(employee.errors.messages[:email]).to include("can't be blank")
  end
end
