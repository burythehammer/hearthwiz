class AddNameToCardSets < ActiveRecord::Migration
  def change
  	add_column :card_sets, :name, :string, :limit => 100
  end
end
