class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :parent_id
      t.references :work, null: true, foreign_key: true
      t.references :customer, null: true, foreign_key: true
      t.string :user_ref
      t.string :our_ref
      t.string :heading
      t.string :locatin
      t.date :start_date
      t.date :due_date
      t.date :end_date

      t.timestamps
    end
  end
end
