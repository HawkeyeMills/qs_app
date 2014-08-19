class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :metricconfig_id
      t.date :date
      t.string :value

      t.timestamps
    end
    add_index :metrics, [:metricconfig_id, :date]
  end
end
