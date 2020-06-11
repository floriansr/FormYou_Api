class Inscription < ApplicationRecord

  belongs_to :session
  belongs_to :student

  validates :student_id, uniqueness: {
    scope: :session_id,
    message: 'is already registered for this session'
  }

  validate :session_must_have_no_more_than_20_students

  def session_must_have_no_more_than_20_students
    errors.add(:session, 'is already full.') if session.students.count >= 20
  end

end
