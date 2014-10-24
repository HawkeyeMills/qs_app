class CreateMetricGrades < ActiveRecord::Migration
  def change
    create_table :metric_grades do |t|
      t.integer :metric_id
      t.integer :grade_id
      t.decimal :points, precision: 10, scale: 2
      t.decimal :percentage, precision: 10, scale: 2

      t.timestamps
    end
  end
end
