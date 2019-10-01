class AddSeasonToProfessions < ActiveRecord::Migration
  def change
    add_column :professions, :season, :string
  end
end
