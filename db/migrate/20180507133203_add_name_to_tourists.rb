class AddNameToTourists < ActiveRecord::Migration
  def change
    add_column :tourists, :name, :string
  end
end
