class CreateRarities < ActiveRecord::Migration
  def change
    create_table :rarities do |t|
      t.timestamps null: false
    end
  end
end
