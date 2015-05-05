class AddPlayerClassToCard < ActiveRecord::Migration
  def change
    add_column :cards, :player_class_id, :integer
  end
end
