class CreateReadingLists < ActiveRecord::Migration[5.1]
  def change
    create_table :reading_lists do |t|
      t.belongs_to :book, index: true
      t.belongs_to :user, index: true
      
      t.timestamps
    end
  end
end
