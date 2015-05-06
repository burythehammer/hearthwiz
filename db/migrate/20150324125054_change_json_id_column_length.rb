class ChangeJsonIdColumnLength < ActiveRecord::Migration
  def change
    change_column :cards, :json_id, :string, limit: 100
  end
end
