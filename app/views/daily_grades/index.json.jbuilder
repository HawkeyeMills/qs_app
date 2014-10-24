json.array!(@daily_grades) do |daily_grade|
  json.extract! daily_grade, :grade_id, :points, :possible, :gradeDate
  json.url daily_grade_url(daily_grade, format: :json)
end