class AddClassIdForeignKeyToCards < ActiveRecord::Migration
  def change
  	add_foreign_key :cards, :player_classes
  end
end
