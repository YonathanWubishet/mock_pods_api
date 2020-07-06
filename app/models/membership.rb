class Membership < ApplicationRecord
    validates :employee_id, presence: true
    validates :pod_id, presence: true
    validates :active, presence: true
  
    belongs_to :pod
    belongs_to :employee
end
