class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.references :country, foreign_key: true
      t.text :avatar_data

      t.timestamps

      # No one can have the same username
    end
  end
end
