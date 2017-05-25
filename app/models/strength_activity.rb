class StrengthActivity < ApplicationRecord
  validates :name, presence: :true, uniqueness: :true
  has_many :activity_muscle_groups
  has_many :muscle_groups, through: :activity_muscle_groups
end