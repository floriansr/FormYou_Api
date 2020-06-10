class JoinTableCourseCategory < ApplicationRecord

  belongs_to :course
  belongs_to :category
  validates :course_id, uniqueness: { scope: :category_id,
                                      message: 'that relation already exists' }

end
