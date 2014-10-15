class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.integer :user_id
      t.datetime :notedate

      t.timestamps
    end
  end
end
