class AddRequestingToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :requesting_team_id, :integer
    add_column :tasks, :managing_team_id, :integer
    add_column :tasks, :operating_team_id, :integer
  end
end
