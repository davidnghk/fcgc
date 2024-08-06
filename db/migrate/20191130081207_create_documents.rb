class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.references :team, null: false, foreign_key: true
      t.string :code
      t.string :user_ref
      t.string :description
      t.string :aasm_state

      t.timestamps
    end
  end
end
