class AddDriverToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :driver, :text
  end
end
