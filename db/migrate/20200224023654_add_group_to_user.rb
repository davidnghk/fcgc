class AddGroupToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :group, :integer, default: 0
  end
end
