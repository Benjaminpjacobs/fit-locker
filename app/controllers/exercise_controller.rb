class ExerciseController < ApplicationController
  def new
    @exercise = CardioExercise.new
  end
end
