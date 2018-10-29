class AddUniversitylToGuiders < ActiveRecord::Migration
  def change
    add_column :guiders, :university, :string
  end
end
