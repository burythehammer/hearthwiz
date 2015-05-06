class NewCardFields < ActiveRecord::Migration
  def change
    add_column :cards, :type, :string
    add_column :cards, :faction, :string
    add_column :cards, :text, :string
    add_column :cards, :mechanics, :string
    add_column :cards, :flavor, :string
    add_column :cards, :artist, :string
    add_column :cards, :attack, :integer
    add_column :cards, :health, :integer
    add_column :cards, :collectible, :boolean
    add_column :cards, :json_id, :string
    add_column :cards, :elite, :boolean
    add_column :cards, :durability, :integer
  end
end
