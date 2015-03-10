class AddCraftingToRarity < ActiveRecord::Migration
  def change
  	add_column :rarities, :craft_cost, :integer
  	add_column :rarities, :disenchant_reward, :integer
  end
end
