class PodSerializer < ActiveModel::Serializer
  attributes :id, :name, :lead, :active

  has_many :memberships
  has_many :employees

  def memberships
    customized_memberships = []
  
    object.memberships.each do |membership|
      custom_membership = membership.attributes
      custom_membership[:employee] = membership.employee.slice(:id, :google_user_id, :first_name, :last_name, :email)
      customized_memberships.push(custom_membership)
    end
  
    return customized_memberships
  end
end