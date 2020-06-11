class CreateInscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :inscriptions do |t|
      t.references :session, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.integer :note, :in => 0..20, default: 0
      t.timestamps
    end
  end
end
