class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :gradevalue
      t.integer :minrange
      t.integer :maxrange

      t.timestamps
    end
  end
end
