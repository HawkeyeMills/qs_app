class AddIndexToMetricsDate < ActiveRecord::Migration
  def change
    #These indexes removed due to issues with upsert when they are turned on
    #add_index :metrics, :metricdate, unique: true
    #add_index :metrics, :metric_config_id, unique: true
  end
end
