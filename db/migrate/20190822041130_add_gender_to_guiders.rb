class AddGenderToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :gender, :string
  end
end
