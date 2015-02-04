class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :cost
      t.string :rarity

      t.timestamps null: false
    end
  end
end
