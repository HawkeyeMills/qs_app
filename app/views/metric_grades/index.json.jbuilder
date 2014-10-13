json.array!(@metric_grades) do |metric_grade|
  json.extract! metric_grade, :metric_id, :grade_id, :points, :percentage
  json.url metric_grade_url(metric_grade, format: :json)
end