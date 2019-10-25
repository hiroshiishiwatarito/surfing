class AddMaterialToTests < ActiveRecord::Migration
  def change
    add_column :tests, :material, :string
  end
end
