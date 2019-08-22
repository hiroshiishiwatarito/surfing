class AddBirthToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :birth, :string
  end
end
