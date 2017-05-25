class CardioExercise < ApplicationRecord
  validates :duration, presence: :true
  validates :distance, presence: :true
  belongs_to :workout
  belongs_to :cardio_activity
end