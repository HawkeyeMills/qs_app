class CreateMetricGrades < ActiveRecord::Migration
  def change
    create_table :metric_grades do |t|
      t.integer :metric_id
      t.integer :grade_id
      t.integer :points
      t.integer :percentage

      t.timestamps
    end
  end
end
