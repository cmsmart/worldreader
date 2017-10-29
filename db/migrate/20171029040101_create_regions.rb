class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.text :map_graphic_data

      t.timestamps
    end
  end
end
