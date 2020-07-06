class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.bigint :employee_id
      t.bigint :pod_id
      t.boolean :active

      t.timestamps
    end
  end
end
