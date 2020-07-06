class Membership < ApplicationRecord
    validates :employee_id, presence: true
    validates :pod_id, presence: true
    validates :active, presence: true
  
    belongs_to :pod, optional: true
    belongs_to :employee, optional: true
end
