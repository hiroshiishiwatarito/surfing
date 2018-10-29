class AddTouristIdToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :tourist_id, :integer
  end
end
