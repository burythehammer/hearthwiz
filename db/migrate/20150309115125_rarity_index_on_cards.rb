class RarityIndexOnCards < ActiveRecord::Migration
  def change
    remove_column :cards, :rarity_id
    change_table :cards do |t|
      t.belongs_to :rarity, index: true
    end
  end
end
