class AddLastNameToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :lastname, :string
  end
end
