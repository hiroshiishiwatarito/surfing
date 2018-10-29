class RemoveInformationIdToGuiders < ActiveRecord::Migration
  def change
    remove_column :guiders, :information_id, :integer
  end
end
