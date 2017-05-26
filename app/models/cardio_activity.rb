class CardioActivity < ApplicationRecord
  validates :name, presence: :true, uniqueness: :true
  has_many :cardio_exercises,  dependent: :destroy
end