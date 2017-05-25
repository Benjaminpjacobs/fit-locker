class ActivityMuscleGroup < ApplicationRecord
  belongs_to :muscle_group
  belongs_to :strength_activity
end