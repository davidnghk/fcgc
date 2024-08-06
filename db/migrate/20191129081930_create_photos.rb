class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.references :photoable, polymorphic: true, null: false
      t.integer :category
      t.decimal :latitude, precision: 15, scale: 8
      t.decimal :longitude, precision: 15, scale: 8
      t.decimal :altitude, precision: 15, scale: 8
      t.datetime :photo_datetime
      t.string :image

      t.timestamps
    end
  end
end
