class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.bigint :google_user_id
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
