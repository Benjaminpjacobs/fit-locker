class User < ApplicationRecord
  has_secure_password
  validates :email, presence: :true, uniqueness: :true
  validates :first_name, :last_name, presence: :true
  has_many :workouts
  enum role: [:user, :admin]

end