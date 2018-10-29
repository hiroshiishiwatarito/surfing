class AddMessageToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :message, :text
  end
end
