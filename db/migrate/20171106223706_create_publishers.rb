class CreatePublishers < ActiveRecord::Migration[5.1]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :contact_person
      t.text :description
      t.string :website
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
