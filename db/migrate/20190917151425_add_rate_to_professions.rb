class AddRateToProfessions < ActiveRecord::Migration
  def change
    add_column :professions, :rate, :float
  end
end
