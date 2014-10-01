class CreateMetricConfigs < ActiveRecord::Migration
  def change
    create_table :metric_configs do |t|
      t.integer :user_id
      t.string :metricname
      t.string :fbvalue
      t.string :metrictype
      t.integer :orderby
      t.boolean :profiledisplay
      t.boolean :updateable

      t.timestamps
    end
  end
end
