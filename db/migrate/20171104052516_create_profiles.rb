class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :username
      t.string :first_name
      t.string :last_name
      t.text :avatar_data

      t.timestamps

      # No one can have the same username
      t.index :username, unique: true
    end
  end
end
