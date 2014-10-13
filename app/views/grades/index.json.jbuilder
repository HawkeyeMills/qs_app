json.array!(@grades) do |grade|
  json.extract! grade, :gradevalue, :minrange, :maxrange
  json.url grade_url(grade, format: :json)
end