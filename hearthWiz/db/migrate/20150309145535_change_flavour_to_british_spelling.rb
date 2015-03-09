class ChangeFlavourToBritishSpelling < ActiveRecord::Migration
  def change
  	rename_column :cards, :flavor, :flavour
  end
end
