class AddGuiderIdToProfessions < ActiveRecord::Migration
  def change
    add_column :professions, :guider_id, :integer
  end
end
