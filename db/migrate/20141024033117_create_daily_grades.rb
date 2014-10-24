class CreateDailyGrades < ActiveRecord::Migration
  def change
    create_table :daily_grades do |t|
      t.integer :grade_id
      t.integer :points
      t.integer :possible
      t.date :gradeDate

      t.timestamps
    end
  end
end
