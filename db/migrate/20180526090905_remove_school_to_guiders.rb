class RemoveSchoolToGuiders < ActiveRecord::Migration
  def change
    remove_column :guiders, :school, :text
  end
end
