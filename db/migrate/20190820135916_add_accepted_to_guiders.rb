class AddAcceptedToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :accepted, :boolean, default: false, null: false
  end
end
