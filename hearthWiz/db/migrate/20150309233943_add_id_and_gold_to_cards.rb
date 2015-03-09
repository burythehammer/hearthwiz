class AddIdAndGoldToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :how_to_get_gold, :string
  end
end