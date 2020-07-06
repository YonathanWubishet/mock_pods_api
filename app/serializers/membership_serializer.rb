class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :pod_id, :active

  belongs_to :pod
  belongs_to :employee
end
