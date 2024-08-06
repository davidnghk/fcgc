class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :team, null: false, foreign_key: true
      t.string :code
      t.string :name
      t.string :local_name

      t.timestamps
    end
  end
end
