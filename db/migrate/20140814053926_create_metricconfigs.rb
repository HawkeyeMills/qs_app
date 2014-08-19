class CreateMetricconfigs < ActiveRecord::Migration
  def change
    create_table :metricconfigs do |t|
      t.string :value
      t.integer :user_id
      t.integer :orderby
      t.boolean :profiledisplay
      t.boolean :updatable

      t.timestamps
    end
    add_index :metricconfigs, [:user_id]
  end
end