class Room < ApplicationRecord

  validates :name, presence: true, uniqueness: { case_sensitivity: false }
  # TODO: we might want to have a method to return a string
  # of available room for a certain time slot on a certain day

  has_many :sessions

end
