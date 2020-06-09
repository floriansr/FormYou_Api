class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.references :instructor, null: false, foreign_key: true
      t.timestamps
    end
    add_index :courses, :title
  end
end
