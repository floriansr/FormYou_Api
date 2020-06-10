class JoinTableCourseCategory < ApplicationRecord

  belongs_to :course
  belongs_to :category
<<<<<<< HEAD
=======
  validates :course_id, uniqueness: { scope: :category_id,
                                      message: 'that relation already exists' }

>>>>>>> 43a2158... rubocop corrections
end
