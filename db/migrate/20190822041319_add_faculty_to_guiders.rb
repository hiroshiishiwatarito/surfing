class AddFacultyToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :faculty, :string
  end
end
