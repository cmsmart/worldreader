class AddPromotedToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :promoted, :boolean
  end
end
