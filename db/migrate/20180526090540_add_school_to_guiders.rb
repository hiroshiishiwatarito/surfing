class AddSchoolToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :school, :text
  end
end
