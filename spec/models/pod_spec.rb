require 'rails_helper'

RSpec.describe Pod, type: :model do
  it 'should test that the factory is valid' do
    expect(FactoryBot.build :pod).to be_valid
  end

  it 'should validate the presence of the name attribute value' do
    pod = FactoryBot.build :pod, name: ''
    expect(pod).not_to be_valid
    expect(pod.errors.messages[:name]).to include("can't be blank")
  end

  it 'should validate the presence of the lead attribute value' do
    pod = FactoryBot.build :pod, lead: ''
    expect(pod).not_to be_valid
    expect(pod.errors.messages[:lead]).to include("can't be blank")
  end
    it 'should validate the presence of the active attribute value' do
    pod = FactoryBot.build :pod, active: ''
    expect(pod).not_to be_valid
    expect(pod.errors.messages[:active]).to include("can't be blank")
  end
end
