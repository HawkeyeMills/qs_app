class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :note
      t.integer :user_id
      t.datetime :notedate

      t.timestamps
    end
  end
end
