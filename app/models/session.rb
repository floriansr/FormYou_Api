class Session < ApplicationRecord

  # the current config is based on the hypothesis that
  # all sessions have exactly the same duration
  # session_time is the starting time

  belongs_to :course
  belongs_to :room
  has_many :inscriptions
  has_many :students, through: :inscriptions

  validates :session_date, presence: true
  validates :session_time, presence: true,
                           # no allowing simutaneous session on same course
                           uniqueness: {
                             scope: %i[session_date course_id],
                             message: 'exists for same course, on same date at same slot'
                           }

  validate :room_must_be_available

  def room_must_be_available
    if room&.sessions&.find { |s| s.session_date == session_date && s.session_time == session_time }
      errors.add(:room, 'must be available during this slot.')
    end
  end

end
