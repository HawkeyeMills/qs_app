class AddIndexToMetricsDate < ActiveRecord::Migration
  def change
    add_index :metrics, :metricdate, unique: true
  end
end
