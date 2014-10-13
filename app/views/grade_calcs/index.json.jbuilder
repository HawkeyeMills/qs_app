json.array!(@grade_calcs) do |grade_calc|
  json.extract! grade_calc, :gradecalc
  json.url grade_calc_url(grade_calc, format: :json)
end