class MuscleGroup < ApplicationRecord
  validates :name, presence: :true, uniqueness: :true
  has_many :activity_muscle_groups,  dependent: :destroy
  has_many :strength_activities, through: :activity_muscle_groups
end