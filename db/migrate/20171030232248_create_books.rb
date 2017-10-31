class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :cover_image_data
      t.text :summary
      t.integer :published_year
      t.string :original_language
      t.references :author, foreign_key: true, null: false

      t.timestamps

    end
  end
end
