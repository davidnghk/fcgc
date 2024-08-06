class CreateIcons < ActiveRecord::Migration[6.0]
  def change
    create_table :icons do |t|
      t.string :code
      t.string :name
      t.string :local_name

      t.timestamps
    end
  end
end
