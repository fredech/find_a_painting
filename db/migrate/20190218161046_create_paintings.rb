class CreatePaintings < ActiveRecord::Migration[5.2]
  def change
    create_table :paintings do |t|
      t.string :name
      t.string :location
      t.integer :price
      t.string :author
      t.string :style
      t.string :availabilities
      t.string :photo

      t.timestamps
    end
  end
end
