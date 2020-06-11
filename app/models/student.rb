class Student < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :inscriptions
  has_many :sessions, through: :inscriptions

end
