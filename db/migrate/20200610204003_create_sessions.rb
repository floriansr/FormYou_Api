class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.references :course, null: false, foreign_key: true
      t.date :session_date, null: false
      t.time :session_time, null: false
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
