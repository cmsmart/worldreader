class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :iso
      t.string :name
      t.references :region, foreign_key: true

      t.timestamps

      t.index :iso, unique: true
    end
  end
end
