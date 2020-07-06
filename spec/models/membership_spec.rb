require 'rails_helper'

RSpec.describe Membership, type: :model do
    it 'should test that the factory is valid' do
        expect(FactoryBot.build :membership).to be_valid
      end
    
      it 'should validate the presence of the employee_id attribute value' do
        membership = FactoryBot.build :membership, employee_id: ''
        expect(membership).not_to be_valid
        expect(membership.errors.messages[:employee_id]).to include("can't be blank")
      end
    
      it 'should validate the presence of the lead attribute value' do
        membership = FactoryBot.build :membership, pod_id: ''
        expect(membership).not_to be_valid
        expect(membership.errors.messages[:pod_id]).to include("can't be blank")
      end
        it 'should validate the presence of the active attribute value' do
        membership = FactoryBot.build :membership, active: ''
        expect(membership).not_to be_valid
        expect(membership.errors.messages[:active]).to include("can't be blank")
      end
end
