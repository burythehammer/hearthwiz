class GiveCardCollectibilityADefault < ActiveRecord::Migration
  def change
    change_column_default(:cards, :collectible, false)
  end
end
