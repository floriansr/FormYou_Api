class Category < ApplicationRecord

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :color_code, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :color_code, with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/

end
