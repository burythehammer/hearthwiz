class AddColumnsToPlayerClasses < ActiveRecord::Migration
  def change
  	add_column :player_classes, :name, :string
  	add_column :player_classes, :hero, :string
  	add_column :player_classes, :colour, :string
  	add_column :player_classes, :hexcolour, :string, limit: 7
  end
end
