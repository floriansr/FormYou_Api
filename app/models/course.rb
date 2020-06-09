class Course < ApplicationRecord

  belongs_to :instructor

  validates :title, null: false, uniqueness: { case_sensitive: false }

end
