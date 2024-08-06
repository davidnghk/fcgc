class AddIconToWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :icon_id, :integer
    add_column :works, :workflow_id, :integer
  end
end
