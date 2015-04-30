class AddRaceToCard < ActiveRecord::Migration
  def change
  	add_column :cards, :race, :string, null: true
  end
end
