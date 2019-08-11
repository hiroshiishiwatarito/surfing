class AddYearToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :year, :string
  end
end
