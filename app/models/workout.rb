class Workout < ApplicationRecord
  validates :name, presence: :true
  validates :date, presence: :true
  validates :category, presence: :true
  belongs_to :user
  enum category: [:cardio, :strength]
end