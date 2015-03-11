class ChangeCardsPrimaryKey < ActiveRecord::Migration
  def up
  	remove_column :cards, :json_id
  	add_column :cards, :json_id, :string, limit: 10
    add_index :cards, :json_id, :unique => true
  end
end