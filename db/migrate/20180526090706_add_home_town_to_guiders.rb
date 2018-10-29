class AddHomeTownToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :hometown, :string
  end
end
