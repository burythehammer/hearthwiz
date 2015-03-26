class AddHexColourToRarity < ActiveRecord::Migration
  def change
  	add_column :rarities, :hexcolour, :string
  end
end
