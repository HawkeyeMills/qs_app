json.array!(@grade_configs) do |grade_config|
  json.extract! grade_config, :metric_config_id, :weight, :percentoftotal, :goal, :calcToUse, :type, :note
  json.url grade_config_url(grade_config, format: :json)
end