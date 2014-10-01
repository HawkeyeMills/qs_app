json.array!(@metric_configs) do |metric_config|
  json.extract! metric_config, :user_id, :value, :orderby, :metrictype, :profiledisplay, :updateable
  json.url metric_config_url(metric_config, format: :json)
end