class CreateGradeConfigs < ActiveRecord::Migration
  def change
    create_table :grade_configs do |t|
      t.integer :metricconfig_id
      t.decimal :weight, precision: 4, scale: 2
      t.decimal :percentoftotal, precision: 8, scale: 3
      t.string :goal
      t.string :calcToUse
      t.string :type
      t.text :note

      t.timestamps
    end
  end
end