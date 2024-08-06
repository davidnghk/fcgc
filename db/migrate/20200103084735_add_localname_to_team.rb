class AddLocalnameToTeam < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_column :teams, :local_name, :string
    add_column :teams, :ancestry, :string
    add_index :teams, :ancestry, algorithm: :concurrently
  end
end
