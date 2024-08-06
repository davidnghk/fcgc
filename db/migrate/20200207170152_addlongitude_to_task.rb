class AddlongitudeToTask < ActiveRecord::Migration[6.0]
  def change
  	add_column :tasks, :longitude, :decimal, precision: 15, scale: 8
    add_column :tasks, :altitude,  :decimal, precision: 15, scale: 8
    add_column :tasks, :latitude,  :decimal, precision: 15, scale: 8
  end
end
