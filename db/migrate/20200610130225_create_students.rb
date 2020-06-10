class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :validated, default: false
      t.timestamps
    end
    add_index :students, :validated
  end
end
