class CreateCardSets < ActiveRecord::Migration
  def change
<<<<<<< HEAD
	  create_table :card_sets do |t|
	      t.timestamps null: false
	  end
  end
end

=======
    create_table :card_sets do |t|
		t.name :string, null: false
	    t.timestamps null: false
    end
  end
end
>>>>>>> 3225faf8f7fcad636fb1c65f8d1179238b185fd1
