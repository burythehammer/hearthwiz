class CreatePlayerClasses < ActiveRecord::Migration
  def change
    create_table :player_classes do |t|
      t.timestamps null: false
    end
  end
end
