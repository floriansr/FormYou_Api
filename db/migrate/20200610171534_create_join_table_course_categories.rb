class CreateJoinTableCourseCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :join_table_course_categories do |t|
      t.references :course, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
