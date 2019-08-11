class AddImageToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :Image, :text
  end
end
