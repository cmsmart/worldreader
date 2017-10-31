class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.references :country, foreign_key: true, null: false
      t.integer :goodreads_id
      t.text :bio
      t.date :dob

      t.timestamps

      t.index :goodreads_id, unique: true
    end
  end
end
