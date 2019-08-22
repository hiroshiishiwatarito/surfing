class AddOccupationToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :occupation, :string
  end
end
