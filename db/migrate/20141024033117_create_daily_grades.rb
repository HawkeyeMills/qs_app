class CreateDailyGrades < ActiveRecord::Migration
  def change
    create_table :daily_grades do |t|
      t.integer :grade_id
      t.decimal :points, precision: 10, scale: 2
      t.decimal :possible, precision: 10, scale: 2
      t.date :gradeDate

      t.timestamps
    end
  end
end
