class AddStarToProfessions < ActiveRecord::Migration
  def change
    add_column :professions, :star, :integer
  end
end
