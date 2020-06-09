class CreateAdministrators < ActiveRecord::Migration[6.0]

  def change
    create_table :administrators do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :validated, null: false, default: false
      t.timestamps
    end
    add_index :administrators, :validated
  end

end
