class AddInformationIdToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :information_id, :integer
  end
end
