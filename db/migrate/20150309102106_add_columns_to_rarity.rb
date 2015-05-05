class AddColumnsToRarity < ActiveRecord::Migration
  def change
    add_column :rarities, :name, :string
    add_column :rarities, :colour, :string
  end
end
