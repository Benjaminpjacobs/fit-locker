class StrengthExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :strength_activity
  has_many :lift_sets
end