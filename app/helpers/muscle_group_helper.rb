module MuscleGroupHelper
  def search_string(activity)
    activity.downcase.split.join("+")
  end
end
