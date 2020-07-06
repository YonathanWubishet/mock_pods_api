class Employee < ApplicationRecord
    validates :google_user_id, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
  
    has_many :memberships
    has_many :pods, through: :memberships
    accepts_nested_attributes_for :memberships
end
