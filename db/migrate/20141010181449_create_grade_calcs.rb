class CreateGradeCalcs < ActiveRecord::Migration
  def change
    create_table :grade_calcs do |t|
      t.string :gradecalc

      t.timestamps
    end
  end
end
