class AddTouristIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :tourist_id, :integer
  end
end
