class Pod < ApplicationRecord
    validates :name, presence: true
    validates :lead, presence: true
    validates :active, presence: true
  
    has_many :memberships
    has_many :employees, through: :memberships
    accepts_nested_attributes_for :memberships
end
