class AddAncestryToTasks < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  
  def change
    add_column :tasks, :ancestry, :string
    add_index :tasks, :ancestry, algorithm: :concurrently
  end
end
