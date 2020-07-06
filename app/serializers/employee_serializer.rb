class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :google_user_id, :first_name, :last_name, :email

  has_many :memberships
  has_many :pods

  def memberships
    customized_memberships = []

    object.memberships.each do |membership|
      custom_membership = membership.attributes
      custom_membership[:pod] = membership.pod.slice(:id, :name, :lead, :active)
      customized_memberships.push(custom_membership)
    end

    return customized_memberships
  end
end
