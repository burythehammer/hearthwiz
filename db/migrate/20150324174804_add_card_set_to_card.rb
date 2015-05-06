class AddCardSetToCard < ActiveRecord::Migration
  def change
    add_column :cards, :card_set_id, :integer, null: false
  end
end
