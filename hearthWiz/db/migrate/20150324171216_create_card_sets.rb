class CreateCardSets < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
		t.name :string, null: false
	    t.timestamps null: false
    end
  end
end
