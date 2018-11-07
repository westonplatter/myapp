class CreateOrgUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :org_users do |t|
      t.integer :user_id
      t.integer :org_id

      t.timestamps
    end
  end
end
