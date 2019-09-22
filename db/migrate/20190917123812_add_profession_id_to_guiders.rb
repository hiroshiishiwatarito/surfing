class AddProfessionIdToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :profession_id, :integer
  end
end
