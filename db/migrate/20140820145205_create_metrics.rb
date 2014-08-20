class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :metricconfig_id
      t.datetime :metricdate
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
