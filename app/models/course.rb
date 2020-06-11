class Course < ApplicationRecord

  belongs_to :instructor
  has_many :join_table_course_categories, dependent: :destroy
  has_many :categories, through: :join_table_course_categories
  has_many :sessions
  validates :title, null: false, uniqueness: { case_sensitive: false }

end
