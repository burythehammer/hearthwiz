class ChangeRarityIdInCards < ActiveRecord::Migration
  def change
  	rename_column(:cards, :rarity, :rarity_id)
  	add_index :cards, :rarity_id
  end
end
