class Workout < ApplicationRecord
  validates :name, presence: :true
  validates :date, presence: :true
  validates :category, presence: :true
  belongs_to :user
  has_many :cardio_exercises, dependent: :destroy
  has_many :strength_exercises, dependent: :destroy
  enum category: [:cardio, :strength]


  def to_param
    "#{id}-#{category}"
  end
end