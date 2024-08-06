class CreateTaskitems < ActiveRecord::Migration[6.0]
  def change
    create_table :taskitems do |t|
      t.references :task, null: false, foreign_key: true
      t.references :workitem, null: false, foreign_key: true
      t.string :model
      t.string :serial_number
      t.integer :rating
      t.string :remarks

      t.timestamps
    end
  end
end
