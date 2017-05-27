require 'csv'

MuscleGroup.destroy_all
StrengthActivity.destroy_all
CardioActivity.destroy_all

activities = CSV.open './db/csv/exercises.csv', headers:true, header_converters: :symbol
activities.each do |row|
  mg = MuscleGroup.find_or_create_by!(name: row[:category].capitalize)
  if row[:cardio]
    sa = CardioActivity.find_or_create_by!(name: row[:exercise].capitalize)
  else
    sa = StrengthActivity.find_or_create_by!(name: row[:exercise].capitalize) 
    sa.muscle_groups << mg
  end 

end
