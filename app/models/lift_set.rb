class LiftSet < ApplicationRecord
  validates :weight, presence: :true
  validates :reps, presence: :true
  belongs_to :strength_exercise
end