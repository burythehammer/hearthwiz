class AddNameToCardSets < ActiveRecord::Migration
  def change
<<<<<<< HEAD
  	add_column :card_sets, :name, :string, :limit => 100
=======
  	add_column :card_sets, :name, :string, limit: 100
>>>>>>> 3225faf8f7fcad636fb1c65f8d1179238b185fd1
  end
end
